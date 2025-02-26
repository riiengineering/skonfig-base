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

# AIX uses the {mk,ch,rm}user(1) utilities natively to manage users.  However,
# these commands don’t map well to this type’s parameters.  E.g. specifying the
# primary group by ID is not supported, and home directories are always created
# and never removed.
# AIX also provides wrapper scripts which replicate the user{add,mod,del}(1)
# commands closely and include code to compensate for the missing features
# already. So we use these commands instead of reimplementing the missing
# pieces.
# But unlike other implementations the -p option to set a password hash
# is not supported.
#
# NOTE: --system is not also not implemented. It could possibly be mapped to
#       the admin attribute, though it has a different meaning than the
#       --system option has on Linux.

# shellcheck source=SCRIPTDIR/usermod.sh
. "${__type:?}/gencode-remote/usermod.sh"

do_create_user() {
	# usage: do_create_user name property[=value]

	__do_user=${1:?}
	shift
	unset -v __do_password

	for __do_arg in "$@"
	do
		case ${__do_arg}
		in
			(password|password=*)
				# AIX useradd(1) does not support the password option,
				# special handling required
				__do_password=${__do_arg#'password='}
				shift

				# TODO: remove when implemented
				echo 'Setting the password is not yet supported on AIX.' >&2
				exit 1
				;;
		esac
	done
	unset -v __do_arg

	__do_argv=$(properties_to_usermod_argv "$@")

	printf 'useradd%s %s\n' \
		"${__do_argv:+ ${__do_argv}}" \
		"$(quote_ifneeded "${__do_user:?}")"

	if test -n "${__do_password-}"
	then
		# set user password
		:  # TODO
	fi

	unset -v __do_user __do_password __do_argv
}

do_modify_user() {
	# usage: do_modify_user name property[=value]

	__do_user=${1:?}
	shift
	unset -v __do_password

	for __do_arg in "$@"
	do
		case ${__do_arg}
		in
			(password|password=*)
				# AIX usermod(1) does not support the password option,
				# special handling required
				__do_password=${__do_arg#'password='}
				shift

				# TODO: remove when implemented
				echo 'Setting the password is not yet supported on AIX.' >&2
				exit 1
				;;
		esac
	done
	unset -v __do_arg

	__do_argv=$(properties_to_usermod_argv "$@")

	printf 'usermod%s %s\n' \
		"${__do_argv:+ ${__do_argv}}" \
		"$(quote_ifneeded "${__do_user:?}")"

	if test -n "${__do_password-}"
	then
		# update user password
		:  # TODO
	fi

	unset -v __do_user __do_password __do_argv
}

do_delete_user() {
	# usage: do_delete_user name property[=value]

	__do_user=${1:?}
	shift
	__do_argv=$(properties_to_usermod_argv "$@")

	printf 'userdel%s %s\n' \
		"${__do_argv:+ ${__do_argv}}" \
		"$(quote_ifneeded "${__do_user:?}")"

	unset -v __do_user __do_argv
}
