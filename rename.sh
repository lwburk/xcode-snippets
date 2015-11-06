#!/bin/bash

suffix="codesnippet"
for snippet in `ls *.$suffix`;
do
    filename=$(xml sel --net -t -v "/plist/dict[1]/key[.='IDECodeSnippetTitle']/following-sibling::string[1]" $snippet | tr -cd '[[:alnum:]]').$suffix
    if [ "$snippet" != "$filename" ]; then
        echo "Renaming $snippet to $filename"
        mv $snippet $filename
    fi;
done;
