#!/bin/bash

#
# 各言語で実装された「001-Print 5+N」のコードをテストし、実行速度を計測するスクリプト
#

# --- 設定 ---
# 色付け用
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# テストケース (入力 => 期待される出力)
declare -A TEST_CASES=(
    [2]=7
    [4]=9
    [100]=105
)

# 一時ファイル (timeコマンドの出力用)
TIME_FILE=$(mktemp)
# スクリプト終了時に一時ファイルを確実に削除
trap 'rm -f "$TIME_FILE"' EXIT

# --- ヘルパー関数 ---

# ヘッダー表示
print_header() {
    echo "========================================="
    echo "  $1"
    echo "========================================="
    echo
}

# テスト実行関数
# $1: 言語名
# $2...: 実行コマンド
run_tests() {
    local lang=$1
    shift
    local cmd=("$@")
    
    echo -e "--- Testing ${YELLOW}${lang}${NC} ---"
    
    local all_passed=true
    for input in "${!TEST_CASES[@]}"; do
        local expected_output=${TEST_CASES[$input]}
        
        # 入力をプログラムに渡して出力を取得 (here-string) と実行時間計測（ms）
        local actual_output start end exec_time
        start=$(date +%s%3N)
        actual_output=$("${cmd[@]}" <<< "$input")
        end=$(date +%s%3N)
        exec_time=$((end - start))

        # 結果を検証して表示
        if [[ "$actual_output" == "$expected_output" ]]; then
            printf "  Input: %-3s -> Output: %-3s. ${GREEN}PASS${NC} (%sms)\n" "$input" "$actual_output" "$exec_time"
        else
            printf "  Input: %-3s -> Output: %-3s (Expected: %-3s). ${RED}FAIL${NC}\n" "$input" "$actual_output" "$expected_output"
            all_passed=false
        fi
    done

    if [ "$all_passed" = false ]; then
        echo -e "--- ${RED}Some tests failed for ${lang}${NC} ---\n"
    else
        echo -e "--- ${GREEN}All tests passed for ${lang}${NC} ---\n"
    fi
}

# --- メイン処理 ---

print_header "Running tests for 001-Print 5+N"


# C
if [ -d "c" ]; then
    echo "C version: $(gcc --version | head -n1)"
    echo "Compiling C..."
    if gcc c/main.c -o c/main.out -std=c17 -O2; then
        run_tests "C" "./c/main.out"
    else
        echo -e "${RED}C compilation failed.${NC}\n"
    fi
fi

# C++
if [ -d "cpp" ]; then
    echo "C++ version: $(g++ --version | head -n1)"
    echo "Compiling C++..."
    if g++ cpp/main.cpp -o cpp/main.out -std=c++17 -O2; then
        run_tests "C++" "./cpp/main.out"
    else
        echo -e "${RED}C++ compilation failed.${NC}\n"
    fi
fi

# C#
if [ -d "csharp" ]; then
    echo "C# version: $(dotnet --version)"
    echo "Building C#..."
    if dotnet build csharp --configuration Release --nologo -v q > /dev/null; then
        # 実行ファイルを直接呼び出し (実行時間のみ計測)
        CS_EXE="csharp/bin/Release/net9.0/csharp"
        if [ -f "$CS_EXE" ]; then
            run_tests "C#" "./$CS_EXE"
        else
            run_tests "C#" "dotnet" "run" "--project" "csharp" "--configuration" "Release" "--no-build"
        fi
    else
        echo -e "${RED}C# build failed.${NC}\n"
    fi
fi

# Java
if [ -d "java" ]; then
    echo "Java version: $(java -version 2>&1 | head -n1)"
    echo "Compiling Java..."
    if javac java/Main.java; then
        run_tests "Java" "java" "-cp" "java" "Main"
    else
        echo -e "${RED}Java compilation failed.${NC}\n"
    fi
fi

# Rust
if [ -d "rust" ]; then
    echo "Rust version: $(rustc --version)"
    echo "Building Rust..."
    if cargo build --manifest-path rust/Cargo.toml --release --quiet; then
        run_tests "Rust" "./rust/target/release/rust"
    else
        echo -e "${RED}Rust build failed.${NC}\n"
    fi
fi

# Go
if [ -d "go" ]; then
    echo "Go version: $(go version)"
    echo "Building Go..."
    if go build -o go/main.out go/main.go; then
        run_tests "Go" "./go/main.out"
    else
        echo -e "${RED}Go build failed.${NC}\n"
    fi
fi

# Python
if [ -d "python" ]; then
    echo "Python version: $(python3 --version)"
    run_tests "Python" "python3" "python/main.py"
fi

# JavaScript (Node.js)
if [ -d "javascript" ]; then
    echo "Node.js version: $(node --version)"
    run_tests "JavaScript" "node" "javascript/main.js"
fi

# TypeScript
if [ -d "typescript" ]; then
    echo "Setting up TypeScript environment..."
    (
        cd typescript
        if [ ! -f package.json ]; then
            npm init -y > /dev/null
        fi
        npm install typescript @types/node > /dev/null
        echo "TypeScript version: $(npx tsc --version)"
        echo "Compiling TypeScript..."
        if npx tsc main.ts --module commonjs --target es2018 --outDir .; then
            cd ..
            run_tests "TypeScript" "node" "typescript/main.js"
        else
            echo -e "${RED}TypeScript compilation failed.${NC}\n"
        fi
    )
fi

# --- Cleanup build artifacts ---
echo "Cleaning up build artifacts..."
# C/C++ executables
rm -f c/main.out cpp/main.out
# C# build artifacts
rm -rf csharp/bin csharp/obj
# Java class
rm -f java/Main.class
# Rust binary
rm -rf rust/target
# Go executable
rm -f go/main.out
# TypeScript artifacts
rm -f typescript/main.js
rm -rf typescript/node_modules typescript/package.json typescript/package-lock.json