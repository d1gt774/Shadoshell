#!/bin/bash

# ShadoShell - A Custom Shell with an Isolated Environment and 40 Unique Commands

SHADODIR="$HOME/ShadoShellEnvironment"

# Initialize the ShadoShell environment directory if it doesn't exist
if [ ! -d "$SHADODIR" ]; then
    mkdir "$SHADODIR"
fi

# Set the starting location inside the ShadoShell environment
cd "$SHADODIR" || exit
echo "Welcome to ShadoShell!"
echo "Type 'commands' to see available commands or 'exit' to quit."
echo "Operating in isolated directory: $SHADODIR"

# Function Definitions
function show_help {
    echo "Available Commands:"
    echo "  commands           - Display this help message"
    echo "  view               - List files in the current directory"
    echo "  enter <dir>        - Change directory within ShadoShell"
    echo "  location           - Show current directory"
    echo "  make_dir <dir>     - Create a new directory"
    echo "  delete <file>      - Remove a file"
    echo "  new_file <file>    - Create an empty file"
    echo "  message <text>     - Display a message"
    echo "  time               - Show current date and time"
    echo "  info               - Display system information"
    echo "  exit               - Exit ShadoShell"
    echo "  write <file>       - Write text to a file"
    echo "  read_file <file>   - Display content of a file"
    echo "  rename <old> <new> - Rename a file or directory"
    echo "  copy <src> <dest>  - Copy a file"
    echo "  move <src> <dest>  - Move a file"
    echo "  count_lines <file> - Count lines in a file"
    echo "  search <pattern> <file> - Search for a pattern in a file"
    echo "  append <file>      - Append text to a file"
    echo "  line_num <file> <num> - Display a specific line from a file"
    echo "  file_size <file>   - Show file size"
    echo "  list_dir           - List directories only"
    echo "  cpu_usage          - Show CPU usage"
    echo "  memory_usage       - Show memory usage"
    echo "  uptime             - Show system uptime"
    echo "  list_env           - List environment variables"
    echo "  set_env <var> <value> - Set an environment variable"
    echo "  unset_env <var>    - Unset an environment variable"
    echo "  clear_screen       - Clear the screen"
    echo "  disk_usage         - Show disk usage"
    echo "  whoami             - Show current user"
    echo "  history            - Show command history"
    echo "  random_number      - Generate a random number"
    echo "  wait <seconds>     - Pause for a number of seconds"
    echo "  show_users         - Show logged-in users"
    echo "  network_info       - Show basic network info"
    echo "  create_archive <file> <archive_name> - Archive a file"
    echo "  extract_archive <archive_name> - Extract a .tar archive"
    echo "  word_count <file>  - Count words in a file"
    echo "  repeat <n> <text>  - Repeat a message n times"
    echo "  countdown <seconds> - Countdown from specified seconds"
}

# Basic Commands
function list_files { ls -l; }
function change_directory { [ -d "$1" ] && cd "$1" && echo "Entered $(pwd)" || echo "Directory not found: $1"; }
function show_directory { echo "Current directory: $(pwd)"; }
function make_directory { mkdir "$1" && echo "Directory created: $1" || echo "Failed to create directory."; }
function remove_file { rm "$1" && echo "File deleted: $1" || echo "Failed to delete file."; }
function create_file { touch "$1" && echo "File created: $1" || echo "Failed to create file."; }
function print_message { echo "$@"; }
function show_date { date; }
function system_info { uname -a; }

# Additional Commands
function write_to_file { echo "Enter text to write to $1 (end with Ctrl+D):"; cat > "$1"; }
function read_file { [ -f "$1" ] && cat "$1" || echo "File not found."; }
function rename_item { mv "$1" "$2" && echo "$1 renamed to $2" || echo "Rename failed."; }
function copy_file { cp "$1" "$2" && echo "$1 copied to $2" || echo "Copy failed."; }
function move_file { mv "$1" "$2" && echo "$1 moved to $2" || echo "Move failed."; }
function count_lines { [ -f "$1" ] && wc -l < "$1" || echo "File not found."; }
function search_file { grep "$1" "$2" || echo "Pattern not found in file."; }
function append_to_file { echo "Enter text to append to $1 (end with Ctrl+D):"; cat >> "$1"; }
function display_line_num { sed -n "${2}p" "$1" || echo "Line not found."; }
function file_size { [ -f "$1" ] && stat -c%s "$1" || echo "File not found."; }
function list_directories { find . -type d -maxdepth 1; }
function cpu_usage { top -bn1 | grep "Cpu(s)"; }
function memory_usage { free -h; }
function system_uptime { uptime; }
function list_environment { printenv; }
function set_environment { export "$1=$2" && echo "Environment variable $1 set to $2"; }
function unset_environment { unset "$1" && echo "Environment variable $1 unset"; }
function clear_screen { clear; }
function disk_usage { df -h; }
function show_user { whoami; }

# New Additional Commands
function show_history { history; }
function generate_random_number { echo $(( RANDOM )); }
function pause_shell { sleep "$1"; }
function show_logged_users { who; }
function network_information { ip a; }
function create_archive { tar -cvf "$2".tar "$1" && echo "Archive $2.tar created."; }
function extract_archive { tar -xvf "$1" && echo "Archive $1 extracted."; }
function count_words { [ -f "$1" ] && wc -w < "$1" || echo "File not found."; }
function repeat_text { for ((i=0; i<$1; i++)); do echo "$2"; done; }
function countdown_timer { for ((i=$1; i>0; i--)); do echo "$i"; sleep 1; done; echo "Time's up!"; }

# Prevent navigating outside the ShadoShell root directory
function restrict_to_shadodir {
    if [[ $(pwd) != $SHADODIR* ]]; then
        echo "You cannot leave the ShadoShell environment."
        cd "$SHADODIR" || exit
    fi
}

# Main Loop - Command Interpreter
while true; do
    # Restrict to ShadoShell's directory
    restrict_to_shadodir

    echo -n "ShadoShell> "
    read -r command args args2 args3

    case $command in
        commands) show_help ;;
        view) list_files ;;
        enter) change_directory "$args" ;;
        location) show_directory ;;
        make_dir) make_directory "$args" ;;
        delete) remove_file "$args" ;;
        new_file) create_file "$args" ;;
        message) print_message "$args" ;;
        time) show_date ;;
        info) system_info ;;
        write) write_to_file "$args" ;;
        read_file) read_file "$args" ;;
        rename) rename_item "$args" "$args2" ;;
        copy) copy_file "$args" "$args2" ;;
        move) move_file "$args" "$args2" ;;
        count_lines) count_lines "$args" ;;
        search) search_file "$args" "$args2" ;;
        append) append_to_file "$args" ;;
        line_num) display_line_num "$args" "$args2" ;;
        file_size) file_size "$args" ;;
        list_dir) list_directories ;;
        cpu_usage) cpu_usage ;;
        memory_usage) memory_usage ;;
        uptime) system_uptime ;;
        list_env) list_environment ;;
        set_env) set_environment "$args" "$args2" ;;
        unset_env) unset_environment "$args" ;;
        clear_screen) clear_screen ;;
        disk_usage) disk_usage ;;
        whoami) show_user ;;
        history) show_history ;;
        random_number) generate_random_number ;;
        wait) pause_shell "$args" ;;
        show_users) show_logged_users ;;
        network_info) network_information ;;
        create_archive) create_archive "$args" "$args2" ;;
        extract_archive) extract_archive "$args" ;;
        word_count) count_words "$args" ;;
        repeat) repeat_text "$args" "$args2" ;;
        countdown) countdown_timer "$args" ;;
        exit) echo "Exiting ShadoShell. Goodbye!"; break ;;
        *) echo "Unknown command: $command. Type 'commands' to see available commands." ;;
    esac
done

