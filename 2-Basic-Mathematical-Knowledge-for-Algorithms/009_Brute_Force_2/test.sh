#!/bin/bash

#
# 各言語で実装された「009-Brute_Force_2」のコードをテストし、実行速度を計測するスクリプト
#

# --- 設定 ---
# 色付け用
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# テストケース (入力 => 期待される出力)
# 2行入力（N S + A1 A2 ... AN、出力はYes/No）
declare -A TEST_CASES

# テストケース1: 問題例1 (3 11 + 2 5 9 => Yes)
TEST_CASES["case1_input"]="3 11
2 5 9"
TEST_CASES["case1_expected"]="Yes"

# テストケース2: 問題例2 (4 11 + 3 1 4 5 => No)
TEST_CASES["case2_input"]="4 11
3 1 4 5"
TEST_CASES["case2_expected"]="No"

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
    local test_count=0
    
    # テストケースを実行
    for i in {1..2}; do
        local input_key="case${i}_input"
        local expected_key="case${i}_expected"
        
        local input="${TEST_CASES[$input_key]}"
        local expected_output="${TEST_CASES[$expected_key]}"
        
        test_count=$((test_count + 1))
        
        # 入力をプログラムに渡して出力を取得と実行時間計測（ms）
        local actual_output start end exec_time
        start=$(date +%s%3N)
        actual_output=$("${cmd[@]}" <<< "$input")
        end=$(date +%s%3N)
        exec_time=$((end - start))

        # 入力データを表示用に取得（N S + 配列形式）
        local input_display=$(echo "$input" | tr '\n' ' | ' | sed 's/ | $//')
        
        # 結果を検証して表示
        if [[ "$actual_output" == "$expected_output" ]]; then
            printf "  Test %d: Input=[%s] -> Output: %-3s. ${GREEN}PASS${NC} (%sms)\n" "$test_count" "$input_display" "$actual_output" "$exec_time"
        else
            printf "  Test %d: Input=[%s] -> Output: %-3s (Expected: %-3s). ${RED}FAIL${NC}\n" "$test_count" "$input_display" "$actual_output" "$expected_output"
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

print_header "Running tests for 009-Brute_Force_2"

# C
if [ -d "c" ] && [ -f "c/main.c" ]; then
    echo "C version: $(gcc --version | head -n1)"
    echo "Compiling C..."
    if gcc c/main.c -o c/main.out -std=c17 -O2; then
        run_tests "C" "./c/main.out"
    else
        echo -e "${RED}C compilation failed.${NC}\n"
    fi
fi

# C++
if [ -d "cpp" ] && [ -f "cpp/main.cpp" ]; then
    echo "C++ version: $(g++ --version | head -n1)"
    echo "Compiling C++..."
    if g++ cpp/main.cpp -o cpp/main.out -std=c++17 -O2; then
        run_tests "C++" "./cpp/main.out"
    else
        echo -e "${RED}C++ compilation failed.${NC}\n"
    fi
fi

# C#
if [ -d "csharp" ] && [ -f "csharp/Program.cs" ]; then
    echo "C# version: $(dotnet --version)"
    echo "Building C#..."
    if dotnet build csharp --configuration Release --nologo -v q > /dev/null; then
        # 実行ファイルを直接呼び出し (実行時間のみ計測)
        # .NETのバージョンによってパスが異なる場合があるため、柔軟に検索
        CS_EXE=$(find csharp/bin/Release -name "csharp" -type f | head -n 1)
        if [ -f "$CS_EXE" ]; then
            run_tests "C#" "$CS_EXE"
        else
            # 見つからない場合は dotnet run で実行
            run_tests "C#" "dotnet" "run" "--project" "csharp" "--configuration" "Release" "--no-build"
        fi
    else
        echo -e "${RED}C# build failed.${NC}\n"
    fi
fi

# Java
if [ -d "java" ] && [ -f "java/Main.java" ]; then
    echo "Java version: $(java -version 2>&1 | head -n1)"
    echo "Compiling Java..."
    if javac java/Main.java; then
        run_tests "Java" "java" "-cp" "java" "Main"
    else
        echo -e "${RED}Java compilation failed.${NC}\n"
    fi
fi

# Rust
if [ -d "rust" ] && [ -f "rust/Cargo.toml" ]; then
    echo "Rust version: $(rustc --version)"
    echo "Building Rust..."
    if cargo build --manifest-path rust/Cargo.toml --release --quiet; then
        run_tests "Rust" "./rust/target/release/rust"
    else
        echo -e "${RED}Rust build failed.${NC}\n"
    fi
fi

# Go
if [ -d "go" ] && [ -f "go/main.go" ]; then
    echo "Go version: $(go version)"
    echo "Building Go..."
    if go build -o go/main.out go/main.go; then
        run_tests "Go" "./go/main.out"
    else
        echo -e "${RED}Go build failed.${NC}\n"
    fi
fi

# Python
if [ -d "python" ] && [ -f "python/main.py" ]; then
    echo "Python version: $(python3 --version)"
    run_tests "Python" "python3" "python/main.py"
fi

# JavaScript (Node.js)
if [ -d "javascript" ] && [ -f "javascript/main.js" ]; then
    echo "Node.js version: $(node --version)"
    run_tests "JavaScript" "node" "javascript/main.js"
fi

# TypeScript
if [ -d "typescript" ] && [ -f "typescript/main.ts" ]; then
    echo "Setting up TypeScript environment..."
    (
        cd typescript
        if [ ! -d "node_modules" ]; then
            echo "Installing TypeScript dependencies..."
            npm install typescript @types/node > /dev/null 2>&1
        fi
        echo "TypeScript version: $(npx tsc --version)"
        echo "Compiling TypeScript..."
        if npx tsc main.ts --module commonjs --target es2018 --outDir .; then
            cd ..
            run_tests "TypeScript" "node" "typescript/main.js"
        else
            cd ..
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
# Rust binary (cargo clean is better but slower)
rm -rf rust/target
# Go executable
rm -f go/main.out
# TypeScript artifacts
rm -f typescript/main.js