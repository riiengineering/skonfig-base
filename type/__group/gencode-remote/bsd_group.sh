#!/bin/sh -e
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

# NetBSD and OpenBSD use the group(8) wrapper utility, but are otherwise
# the same as user{add,mod,del}.  We import groupmod.sh and overwrite
# the functions accordingly.

# shellcheck source=SCRIPTDIR/groupmod.sh
. "${__type:?}/gencode-remote/groupmod.sh"


supported_change_properties='gid'

do_create_group() {
	# usage: do_create_group name property[=value]

	__do_group=${1:?}
	shift

	printf 'group add %s %s\n' \
		"$(properties_to_groupmod_argv "$@")" \
		"$(shquot "${__do_group:?}")"

	unset -v __do_group
}

do_modify_group() {
	# usage: do_modify_group name property[=value]

	__do_group=${1:?}
	shift

	printf 'group mod %s %s\n' \
		"$(properties_to_groupmod_argv "$@")" \
		"$(shquot "${__do_group:?}")"

	unset -v __do_group
}

do_delete_group() {
	# usage: do_delete_group name

	printf 'group del %s\n' \
		"$(shquot "${1:?}")"
}
