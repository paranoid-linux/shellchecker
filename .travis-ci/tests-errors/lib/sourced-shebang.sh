#!/usr/local/sbin/shellchecker bash


sourced_shebang() {
  printf 'sourced_shebang has been sourced by %s\n' "${1}"
  printf '_noOpp -> %s\n' "${_noOpp}"
}

