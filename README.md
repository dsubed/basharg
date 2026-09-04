# basharg

Small Bash argument parsing helpers for scripts that need named options and
positional arguments without depending on external tools.

## Usage

Source `basharg` from your script, declare the arguments, and parse `"$@"`:

```bash
#!/bin/bash

source /usr/local/bin/basharg

basharg.add_argument "-t" "--test" "default-value"
basharg.add_argument "-v" "--verbose"
basharg.add_positional_argument "username" true
basharg.add_positional_argument "password"

basharg.parse_arguments "$@"

# Print the parsed values in argument form.
basharg.print_arguments
```

For example:

```text
$ ./example.sh --test custom-value alice secret
-t custom-value alice secret
```

## API

### `basharg.add_argument short_name long_name [default]`

Registers an option. The third argument is optional:

- When supplied, the option takes a value and uses it as its default.
- When omitted, the option is a boolean flag. A present flag is represented by
  `true` internally.

Both `-t value` and `--test=value` are supported for value-taking options.
Long and short names are both accepted while parsing.

### `basharg.add_positional_argument name [mandatory]`

Registers a positional argument. Positional arguments are assigned in the
order they are declared. Set `mandatory` to `true` to require a value.

### `basharg.parse_arguments "$@"`

Parses the script arguments and stores the results in the library's internal
argument state. `-h` and `--help` print the generated help text and exit with
status `0`.

Unknown options, unexpected positional arguments, and missing mandatory
positionals print an error and exit with status `2`.

### `basharg.print_help`

Prints usage information generated from the registered options and positional
arguments.

### `basharg.print_arguments`

Prints the parsed arguments as a space-separated string. Set options are
printed using their short names, followed by positional arguments in
declaration order.

## Development

The test scripts are in `tests/`. Run an individual test from that directory:

```bash
bashtester arguments.test
```

`basharg` requires Bash associative arrays, so use Bash 4 or newer.
