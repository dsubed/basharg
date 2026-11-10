

source ../src/usr/local/bin/basharg # source the bash arguments script

basharg.add_argument "-t" "--test" "default_value"
basharg.add_argument "-h" "--help"
basharg.add_positional_argument "username" true
basharg.add_positional_argument "password"
basharg.parse_arguments "$@"

basharg.print_arguments

basharg.print_help