#!/bin/bash

#Create a bash script that accepts the directory paths as arguments. For each argument,
#list the contents of each listed at the top.
#The script should accept an additional argument "a" or "d" that sorts the contents of each
#directory in either ascending or descending order.

# Function to list and sort contents of a directory

list_and_sort_directory() {
    local dir="$1"
    local order="$2"

    if [ "$order" = "a" ]; then
        echo "Contents of $dir (ascending order):"
        ls -l "$dir"
    elif [ "$order" = "d" ]; then
        echo "Contents of $dir (descending order):"
        ls -l -r "$dir"
    else
        echo "Invalid sorting option. Use 'a' for ascending or 'd' for descending order."
    fi
}

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <directory1> [<directory2> ...] <a|d>"
    exit 1
fi

# Get the last argument for sorting order

order="${!#}"

# Check if the last argument is 'a' or 'd'
if [ "$order" != "a" ] && [ "$order" != "d" ]; then
    echo "Invalid sorting option. Use 'a' for ascending or 'd' for descending order."
    exit 1
fi

# Loop through directory arguments and list/sort them
for ((i = 1; i < $#; i++)); do
    directory="${!i}"
    if [ -d "$directory" ]; then
        list_and_sort_directory "$directory" "$order"
    else
        echo "Directory '$directory' does not exist or is not a directory."
    fi
done
