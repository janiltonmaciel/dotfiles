#!/bin/bash

# https://stackoverflow.com/questions/12850030/git-getting-all-previous-version-of-a-specific-file-folder/41834486#41834486?newreg=6db77a2084be4f248bb5f38faecc910d


SHORT_FILENAME=$(basename $1)
if [ "$2" != "" ]; then
    SHORT_FILENAME="$2"
fi

# we'll write all git versions of the file to this folder:
EXPORT_TO=/tmp/all_versions_exported
if [ "$3" != "" ]; then
    EXPORT_TO="$3"
fi
EXPORT_TO=$EXPORT_TO/$SHORT_FILENAME

echo $EXPORT_TO

# # take relative path to the file to inspect
GIT_PATH_TO_FILE=$1

# # ---------------- don't edit below this line --------------

USAGE="Please cd to the root of your git proj and specify path to file you with to inspect (example: $0 some/path/to/file)"

# check if got argument
if [ "${GIT_PATH_TO_FILE}" == "" ]; then
    echo "error: no arguments given. ${USAGE}" >&2
    exit 1
fi

# check if file exist
if [ ! -f ${GIT_PATH_TO_FILE} ]; then
    echo "error: File '${GIT_PATH_TO_FILE}' does not exist. ${USAGE}" >&2
    exit 1
fi

# extract just a filename from given relative path (will be used in result file names)
GIT_SHORT_FILENAME=$(basename $GIT_PATH_TO_FILE)

# create folder to store all revisions of the file
echo "creating folder: ${EXPORT_TO}"
rm -rf ${EXPORT_TO}
mkdir -p ${EXPORT_TO}

## uncomment next line to clear export folder each time you run script
#rm ${EXPORT_TO}/*

# reset coutner
COUNT=0

# iterate all revisions
git rev-list --all --objects -- ${GIT_PATH_TO_FILE} | \
    cut -d ' ' -f1 | \
while read h; do \
     COUNT=$((COUNT + 1)); \
     COUNT_PRETTY=$(printf "%04d" $COUNT); \
     COMMIT_DATE=`git show --date=iso $h | head -3 | grep 'Date:' | awk '{print $2"T"$3}'`; \
     if [ "${COMMIT_DATE}" != "" ]; then \
         git cat-file -p ${h}:${GIT_PATH_TO_FILE} > ${EXPORT_TO}/${COUNT_PRETTY}_${COMMIT_DATE}_${h}_${GIT_SHORT_FILENAME}.txt;\
     fi;\
done

# return success code
echo "result stored to ${EXPORT_TO}"
exit 0
