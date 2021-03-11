#!/bin/bash

set -e

if [[ "${GITHUB_EVENT_NAME}" == "pull_request" ]]; then
	EVENT_ACTION=$(jq -r ".action" "${GITHUB_EVENT_PATH}")
	if [[ "${EVENT_ACTION}" != "opened" ]]; then
		echo "No need to run analysis. It is already triggered by the push event."
		exit
	fi
fi

curl --location --request POST \
"https://api.appcenter.ms/v0.1/apps/${INPUT_ORGANIZATION}/${INPUT_APPLICATION}/branches/${INPUT_BRANCH}/builds" \
--header "X-API-token: ${INPUT_APPCENTERTOKEN}"