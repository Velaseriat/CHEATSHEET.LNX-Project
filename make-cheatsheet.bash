#!/bin/bash

# only .MD (Markdown) files will be collected.
# files will be collected from the Sections/ directory at project root.
# Please add a single newline to the end of each of your files.

# Initialize the contents of CHEATSHEET.LNX
# -n: disables newline output '\n'
echo -n > CHEATSHEET.LNX

# Appends the sections
# Sections are simple file fragments
# The entire content of each file fragment is appended
# to the resultant file in the order in which they appear in the file system.
# That "order" is determined by the shell's collation system.
# Collation is their way of ordering files in a directory by their names.
# By default, collation is done *alphabetically*.
# Thus, the file whose name comes first alphabetically will be appended at the top.
# And the file whose name comes last will appear at the bottom.

LC_COLLATE=C    # set collation

for f in Sections/*.md          # only .MD (Markdown) files will be collected.
do
    cat $f >> CHEATSHEET.LNX
    echo >> CHEATSHEET.LNX      # give an extra newline to space out headings.
    echo "Appended file $f"
done
echo "Work is done. See CHEATSHEET.LNX. Calling again will overwrite it from the beginning."
