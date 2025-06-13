#!/bin/bash

mkdir -p content/posts

for file in _posts/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        date_part=$(echo "$filename" | cut -d'-' -f1-3)
        title_part=$(echo "$filename" | cut -d'-' -f4- | sed 's/\.[^.]*$//')
        hugo_filename="content/posts/${date_part}-${title_part}.md"

        # Try to extract title from front matter
        title=$(awk -F': ' '/^title:/ {print substr($0, index($0,$2))}' "$file" | head -n1 | sed 's/^["'\'' ]*//;s/["'\'' ]*$//')
        if [ -z "$title" ]; then
            # Fallback to filename, title-cased
            title=$(echo "$title_part" | sed 's/-/ /g' | sed 's/\b\(\w\)/\u\1/g')
        fi

        # Try to extract Jekyll front matter
        if grep -q '^---' "$file"; then
            # Extract everything after the first front matter block
            post_content=$(awk '/^---/{f=!f; next} !f' "$file")
        else
            post_content=$(cat "$file")
        fi

        hugo_front_matter="---\n"
        hugo_front_matter+="title: \"$title\"\n"
        hugo_front_matter+="date: ${date_part}\n"
        hugo_front_matter+="draft: false\n"
        hugo_front_matter+="---\n\n"

        echo -e "$hugo_front_matter$post_content" > "$hugo_filename"
    fi
done 