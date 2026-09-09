

source /home/a000974/github_private/basharg/src/usr/local/bin/basharg # source the bash arguments script

basharg.add_argument "-t" "--test" "a description of the test argument"
basharg.add_argument "-c" "--some_crazy_long_argument_name" "a description of the crazy long argument"
# basharg.add_argument "-h" "--help"
basharg.add_positional_argument "username" true
basharg.add_positional_argument "password" 
basharg.parse_arguments "$@"

# basharg.print_arguments

echo $(basharg.get_argument_value "username")
echo $(basharg.get_argument_value "--test")