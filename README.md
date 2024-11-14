ShadoShell is a custom shell environment built to provide users with a unique set of commands designed to operate in an isolated directory environment. This shell includes 40 distinct commands that allow users to manipulate files, interact with system resources, and manage directories, all within a contained and secure environment.

Installation
To install ShadoShell:

Clone the repository or copy the script to your preferred location.
Ensure that your shell environment has permission to execute the script.
Run the script using your terminal.
bash
Copy code
bash ShadoShell.sh
This will start the ShadoShell environment in the $HOME/ShadoShellEnvironment directory. If the directory doesn't exist, it will be created automatically.

Features
ShadoShell includes several commands grouped into different categories, including file manipulation, system information, and network operations.

Available Commands
File Operations:

view - List files in the current directory
enter <dir> - Change directory within ShadoShell
make_dir <dir> - Create a new directory
delete <file> - Remove a file
new_file <file> - Create an empty file
write <file> - Write text to a file
read_file <file> - Display content of a file
rename <old> <new> - Rename a file or directory
copy <src> <dest> - Copy a file
move <src> <dest> - Move a file
count_lines <file> - Count lines in a file
search <pattern> <file> - Search for a pattern in a file
append <file> - Append text to a file
line_num <file> <num> - Display a specific line from a file
file_size <file> - Show file size
System Information:

time - Show current date and time
info - Display system information
cpu_usage - Show CPU usage
memory_usage - Show memory usage
uptime - Show system uptime
disk_usage - Show disk usage
Environment and User Management:

list_env - List environment variables
set_env <var> <value> - Set an environment variable
unset_env <var> - Unset an environment variable
whoami - Show current user
show_users - Show logged-in users
Miscellaneous:

clear_screen - Clear the screen
random_number - Generate a random number
wait <seconds> - Pause for a number of seconds
history - Show command history
network_info - Show basic network info
create_archive <file> <archive_name> - Archive a file
extract_archive <archive_name> - Extract a .tar archive
word_count <file> - Count words in a file
repeat <n> <text> - Repeat a message n times
countdown <seconds> - Countdown from specified seconds
Exit:

exit - Exit the ShadoShell
ShadoShell Environment
All commands and operations are restricted to the ShadoShellEnvironment directory ($HOME/ShadoShellEnvironment).
You cannot leave this environment while using ShadoShell, ensuring that all activities are contained within the environment for safety and isolation.
Examples
To get started, type commands to see a list of available commands, or use the following commands:

enter my_directory - To enter a directory.
make_dir test_directory - To create a new directory.
delete test_file.txt - To delete a file.
cpu_usage - To see CPU usage.
Exit the Shell
To exit the ShadoShell environment, simply type:

bash
Copy code
exit
