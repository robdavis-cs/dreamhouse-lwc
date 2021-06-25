#!/bin/bash

# Use the error status of the first failure, rather than that of the last item in a pipeline.
set -o pipefail
##############################################################################################################
DEFAULT_SCRATCH_ORG_LENGTH=7

if [ $# -lt 1 ]
then
    echo "Usage: setup_scratch_org.sh alias <days>"
    exit 1
fi

ALIAS=$1
DAYS=$2

##########Default Values###################
if [ -z "$DAYS" ] ; then
    DAYS=$DEFAULT_SCRATCH_ORG_LENGTH
fi
if [ 0 -gt $DAYS ] || [ $DAYS -gt 30 ] ; then
    echo "DAYS must be a number between 1 and 30"
    exit 1
fi

#create a scratch org for this branch
sfdx force:org:create -s -f config/project-scratch-def.json -a $ALIAS -d $DAYS;

## push local code artifacts to scratch org
sfdx force:source:push;

# open new scratch org in browser to default page
sfdx force:org:open -p one/one.app
# open new scratch org in browser to default page
# unless there is an additional arg indicating this is in CI
exit