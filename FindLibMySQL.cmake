# - Try to find MySQL headers and libraries.
#
# Usage of this module as follows:
#
#     find_package(LibMYSQL)
#
# Variables used by this module, they can change the default behaviour and need
# to be set before calling find_package:
#
#  LibMYSQL_ROOT_DIR  Set this variable to the root installation of
#                     LibMYSQL if the module has problems finding
#                     the proper installation path.
#
# Variables defined by this module:
#
#  LIBMYSQL_FOUND              System has LibMYSQL libs/headers
#  LibMYSQL_LIBRARIES          The LibMYSQL libraries
#  LibMYSQL_INCLUDE_DIR        The location of LibMYSQL headers

find_path(LibMYSQL_ROOT_DIR
    NAMES include/mysql_connection.h
)

find_library(LibMYSQL_LIBRARIES
    NAMES mysqlcppconn
    HINTS ${LibMYSQL_ROOT_DIR}/lib
)

find_path(LibMYSQL_INCLUDE_DIR
    NAMES mysql_connection.h
    HINTS ${LibMYSQL_ROOT_DIR}/include
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibMYSQL DEFAULT_MSG
    LibMYSQL_LIBRARIES
    LibMYSQL_INCLUDE_DIR
)

mark_as_advanced(
    LibMYSQL_ROOT_DIR
    LibMYSQL_LIBRARIES
    LibMYSQL_INCLUDE_DIR
)
