

source /home/a000974/github_private/basharg/src/usr/local/bin/basharg # source the bash arguments script

basharg.add_argument "-t" "--test" "Description for the test argument"
basharg.add_argument "-h" "--help"
basharg.add_positional_argument "username" true
basharg.add_positional_argument "password" 
basharg.parse_arguments "$@"

basharg.print_arguments