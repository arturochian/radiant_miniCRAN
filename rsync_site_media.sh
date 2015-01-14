# moving files to server
rsync -avruz --progress --delete -e ssh bin/ ubu:miniCRAN/bin/
rsync -avruz --progress --delete -e ssh src/ ubu:miniCRAN/src/
