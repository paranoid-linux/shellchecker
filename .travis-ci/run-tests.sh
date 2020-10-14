#!/usr/bin/env bash


set -E -o functrace


## Find true directory script resides in, true name, and true path
__SOURCE__="${BASH_SOURCE[0]}"
while [[ -h "${__SOURCE__}" ]]; do
    __SOURCE__="$(find "${__SOURCE__}" -type l -ls | sed -n 's@^.* -> \(.*\)@\1@p')"
done
__DIR__="$(cd -P "$(dirname "${__SOURCE__}")" && pwd)"


tests_errors__bash_invalid_option() {
    local expected='bash: --noOpp: invalid option'
    local result="$("${__DIR__}/tests-errors/bash-invalid-option.sh" 2>&1 1>/dev/null | head -n1)"

    if [[ "${result}" == "${expected}" ]]; then
        printf 'Success: tests-errors/bash-invalid-option.sh\n'
    else
        printf >&2 '# Error: tests-errors/bash-invalid-option.sh STDOUT did not match expected value!\n'
        printf >&2 '# ===STDOUT=== #\n%s\n' "${result}"
        printf >&2 '# ===EXPECTED=== #\n%s\n###\n' "${expected}"
        return 1
    fi
}


##
tests_errors__undefined_variable() {
    read -r -d '' expected <<EOF
In ${__DIR__}/tests-errors/undefined-variable.sh line 3:
echo "\${_noOpp}"
      ^-- SC2154: _noOpp is referenced but not assigned.
EOF

    local result="$("${__DIR__}/tests-errors/undefined-variable.sh" | sed '/^$/d')"

    if [[ "${result}" == "${expected}" ]]; then
        printf 'Success: tests-errors/undefined-variable.sh\n'
    else
        printf >&2 '# Error: tests-errors/undefined-variable.sh STDOUT did not match expected value!\n'
        printf >&2 '# ===STDOUT=== #\n%s\n' "${result}"
        printf >&2 '# ===EXPECTED=== #\n%s\n###\n' "${expected}"
        return 1
    fi
}


tests_errors__shellcheck_unreconized_option() {
    local expected="unrecognized option \`--noOpp'"
    local result="$("${__DIR__}/tests-errors/shellcheck-unrecognized-option.sh" 2>&1 1>/dev/null | head -n1)"

    if [[ "${result}" == "${expected}" ]]; then
        printf 'Success: tests-errors/shellcheck-unrecognized-option.sh\n'
    else
        printf >&2 '# Error: tests-errors/shellcheck-unrecognized-option.sh STDOUT did not match expected value!\n'
        printf >&2 '# ===STDOUT=== #\n%s\n' "${result}"
        printf >&2 '# ===EXPECTED=== #\n%s\n###\n' "${expected}"
        return 1
    fi
}


## Warning: this test is _wrong_ if `shellcheck -x <path>` really does function!
tests_errors__sourced_shebang() {
#     read -r -d '' expected <<'EOF'
# In .travis-ci/tests-errors/lib/sourced-shebang.sh line 6:
#   printf '_noOpp -> %s\n' "${_noOpp}"
#                            ^-- SC2154: _noOpp is referenced but not assigned.
# EOF
    local expected="$(printf 'sourced_shebang has been sourced by tests-errors/sourced-shebang.sh\n_noOpp -> \n')"
    local result="$("${__DIR__}/tests-errors/sourced-shebang.sh" | sed '/^$/d')"

    if [[ "${result}" == "${expected}" ]]; then
        printf 'Success: tests-errors/sourced-shebang.sh\n'
    else
        printf >&2 '# Error: tests-errors/sourced-shebang.sh STDOUT did not match expected value!\n'
        printf >&2 '# ===STDOUT=== #\n%s\n' "${result}"
        printf >&2 '# ===EXPECTED=== #\n%s\n###\n' "${expected}"
        return 1
    fi
}


##
tests_features__argument_printer() {
    read -r -d '' expected <<'EOF'
_argument_list[0] -> --opt
_argument_list[1] -> stringy argument
EOF

    local result="$("${__DIR__}/tests-features/argument-printer.sh" --opt 'stringy argument')"

    if [[ "${result}" == "${expected}" ]]; then
        printf 'Success: tests-features/argument-printer.sh\n'
    else
        printf >&2 '# Error: tests-features/argument-printer.sh STDOUT did not match expected value!\n'
        printf >&2 '# ===STDOUT=== #\n%s\n' "${result}"
        printf >&2 '# ===EXPECTED=== #\n%s\n###\n' "${expected}"
        return 1
    fi
}


##
tests_features__exclude_check() {
    read -r -d '' expected <<'EOF'
_noOpp -> 
Successfully excluded 2154 via shebang
EOF

    local result="$("${__DIR__}/tests-features/exclude-check.sh")"

    if [[ "${result}" == "${expected}" ]]; then
        printf 'Success: tests-features/excluded-check.sh\n'
    else
        printf >&2 '# Error: tests-features/excluded-check.sh STDOUT did not match expected value!\n'
        printf >&2 '# ===STDOUT=== #\n%s\n' "${result}"
        printf >&2 '# ===EXPECTED=== #\n%s\n###\n' "${expected}"
        return 1
    fi
}


##
tests_features__format_option() {
    local expected="${__DIR__}/tests-features/format-option.sh:4:26: warning: _noOpp is referenced but not assigned. [SC2154]"
    local result="$("${__DIR__}/tests-features/format-option.sh")"

    if [[ "${result}" == "${expected}" ]]; then
        printf 'Success: tests-features/format-option.sh\n'
    else
        printf >&2 '# Error: tests-features/format-option.sh STDOUT did not match expected value!\n'
        printf >&2 '# ===STDOUT=== #\n%s\n' "${result}"
        printf >&2 '# ===EXPECTED=== #\n%s\n###\n' "${expected}"
        return 1
    fi
}


##
tests_features__shell_option() {
    local expected='sourced_shebang has been sourced by sourced-shebang.sh'
    local result="$("${__DIR__}/tests-features/sourced-shebang.sh")"

    if [[ "${result}" == "${expected}" ]]; then
        printf 'Success: tests-features/sourced-shebang.sh\n';
    else
        printf >&2 '# Error: tests-features/sourced-shebang.sh STDOUT did not match expected value!\n'
        printf >&2 '# ===STDOUT=== #\n%s\n' "${result}"
        printf >&2 '# ===EXPECTED=== #\n%s\n###\n' "${expected}"
        return 1
    fi
}


##
tests_features__sourced_shebang() {
    local expected='sourced_shebang has been sourced by sourced-shebang.sh'
    local result="$("${__DIR__}/tests-features/sourced-shebang.sh")"

    if [[ "${result}" == "${expected}" ]]; then
        printf 'Success: tests-features/sourced-shebang.sh\n';
    else
        printf >&2 '# Error: tests-features/sourced-shebang.sh STDOUT did not match expected value!\n'
        printf >&2 '# ===STDOUT=== #\n%s\n' "${result}"
        printf >&2 '# ===EXPECTED=== #\n%s\n###\n' "${expected}"
        return 1
    fi
}


##
tests_errors() {
    printf '## Tests Error States...\n'
    tests_errors__bash_invalid_option
    tests_errors__undefined_variable
    tests_errors__shellcheck_unreconized_option
    tests_errors__sourced_shebang
}


##
tests_features() {
    printf '## Tests Features...\n'
    tests_features__argument_printer
    tests_features__exclude_check
    tests_features__format_option
    tests_features__shell_option
    tests_features__sourced_shebang
}


##
run_tests() {
    tests_errors
    tests_features
}


run_tests

