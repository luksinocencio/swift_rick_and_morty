#!/bin/sh
source ./Scripts/menuselect.sh

# Set permissions for *.sh
find Scripts -name '*.sh' -exec chmod +x {} +

base_branch="dev"
description=""

while getopts 'b:d:' opt; do
    case $opt in
        b) base_branch="$OPTARG" ;;
        d) description="$OPTARG" ;;
        *) exit 1;
    esac
done

# Deletes the temporary file, if it exists here by an error
input="Scripts/Templates/prtemplate.txt"
output=".pullrequest"
rm -rf $output

echo "✨  ✨  Pull Request ✨  ✨ "
echo "\n"

# Description
if [[ -z $description ]]; then
    description=$(git show -s --format=%s)
fi

# Change type
echo "✨ Tipo da mudança(utilize a tecla espaço para selecionar):"
multiselect change_type "- Correção de bug;- Novo recurso;- Refatoração;- Hotfix: Correção de bug em produção "

# Join title
title="$description"
echo "\n$title\n"


# read template and replace with information given above
while IFS= read -r line
do 
    case $line in
        \[commit_message\]) echo $description >> $output ;;
        \[change_type\]) ( IFS=$'\n'; echo "${change_type[*]}") >> $output ;;
        *) echo "$line" >> $output ;;
    esac
done < "$input"

# Open pull request with gh CLI
gh pr create --title "$title" --base $base_branch --body-file $output --web

# remove temp output file
rm -rf $output