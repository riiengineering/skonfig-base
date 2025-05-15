#
# 2025 Dennis Camera (dennis.camera at riiengineering.ch)
#
# This file is part of skonfig-base.
#
# skonfig-base is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# skonfig-base is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with skonfig-base. If not, see <http://www.gnu.org/licenses/>.
#

properties_to_aix_argv() {
	for __group_prop in "$@"
	do
		case ${__group_prop}
		in
			(gid=*)
				set -- "$@" id="${__group_prop#*=}"
				;;
			(password|password=*)
				echo 'This system does not support group passwords.' >&2
				return 1
				;;
			(system|system=*)
				echo 'This system does not support --system.' >&2
				return 1
				;;
			(*)
				return 1
				;;
		esac
		shift
	done
	unset -v __group_prop

	quote_ifneeded "$@"
}

do_create_group() {
	# usage: do_create_group name property[=value]

	__do_group=${1:?}
	shift
	__do_argv=$(properties_to_aix_argv "$@")

	printf 'mkgroup%s %s\n' \
		"${__do_argv:+ ${__do_argv}}" \
		"$(quote_ifneeded "${__do_group:?}")"

	unset -v __do_group __do_argv
}

do_modify_group() {
	# usage: do_modify_group name property[=value]

	__do_group=${1:?}
	shift
	__do_argv=$(properties_to_aix_argv "$@")

	printf 'chgroup%s %s' \
		"${__do_argv:+ ${__do_argv}}" \
		"$(quote_ifneeded "${__do_group:?}")"

	unset -v __do_group __do_argv
}

do_delete_group() {
	# usage: do_delete_group name

	printf 'rmgroup %s\n' \
		"$(quote_ifneeded "${1:?}")"
}
