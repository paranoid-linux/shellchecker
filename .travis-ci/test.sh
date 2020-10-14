#!/usr/local/sbin/shellchecker bash --noOpp

_argument_list=("${@}")
for i in "${!_argument_list[@]}"; do
    printf '_argument_list[%i] -> %s\n' "${i}" "${_argument_list[${i}]}"
done

