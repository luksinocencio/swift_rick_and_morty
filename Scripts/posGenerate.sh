set -euo pipefail

OPEN="${1:-yes}"

# ÚLTIMO PASSO - Abre o projeto após finalizar o comando
if [ "$OPEN" != "no" ]; then
        printf "\nOpening project...\n"
	    open RickAndMorty.xcodeproj
else
    printf '\nRickAndMorty project is closed, please open the project manually\n'
fi

exit 0