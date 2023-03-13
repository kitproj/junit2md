# junit2md

Convert Junit XML reports (`junit.xml`) into Markdown reports using Golang.

* Standalone binary.
* Failed tests are top, that's what's important.
* Looks ... good enough.

## Screenshot

![screenshot](screenshot.png)

## Install

Like `jq`, `junit2md` is a tiny (8Mb) standalone binary. You can download it from the [releases page](https://github.com/kitproj/junit2md/releases/latest).

If you're on MacOS, you can use `brew`:

```bash
brew tap kitproj/junit2md --custom-remote https://github.com/kitproj/junit2md
brew install junit2md
```

Otherwise, you can use `curl`:

```bash
curl -q https://raw.githubusercontent.com/kitproj/junit2md/main/install.sh | sh
```

## Usage

Here is an example that uses trap to always created the test report:

```bash
go install github.com/jstemmer/go-junit-report@latest

trap 'go-junit-report < test.out > junit.xml && junit2md < junit.xml > test-report.md' EXIT

go test -v -cover ./... 2>&1 > test.out
```

💡 Don't use pipes (i.e. `|`) in shell, pipes swallow exit codes. Use `<` and `>` which is POSIX compliant.

## Test

How to test this locally:

```bash
go test -v -cover ./... 2>&1 > test.out
go-junit-report < test.out > junit.xml 
go run . < junit.xml > test-report.md 
```
