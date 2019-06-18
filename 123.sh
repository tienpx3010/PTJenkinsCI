echo "Send Notification To ChatWork"

CW_ID="3797568"
CW_NAME="Hoang Xuan Cuong"

JSON=$(curl --silent ${BUILD_URL}api/json)
BUILD_STATUS=$(jq -r '.result' <<< "$JSON")

TEST_PATH='testReport/(root)/api/json'
TEST_JSON=$(curl --silent ${BUILD_URL}${TEST_PATH})
echo ${TEST_JSON}
PASS_COUNT=$(jq -r '.passCount' <<< "$TEST_JSON")
FAIL_COUNT=$(jq -r '.failCount' <<< "$TEST_JSON")

if [[ $BUILD_STATUS == "SUCCESS" ]]
then
BUILD_EMOJI="(cracker)"
BUILD_STATUS_IMAGE="(ok2)"
else
BUILD_EMOJI=":("
BUILD_STATUS_IMAGE="(problem)"
fi

if [ -z "$PASS_COUNT" ]
then
TEST_MESSAGE="Test: No available"
else
TEST_MESSAGE="Test Result: Executed $(( PASS_COUNT + FAIL_COUNT )) tests, with ${FAIL_COUNT} failures"
TEST_LINK_MESSAGE="\nLink: ${RUN_TESTS_DISPLAY_URL}"
fi

MESSAGE="[To:${CW_ID}] ${CW_NAME}
[info][title]This is an automated message please do not reply[/title]${BUILD_STATUS_IMAGE}[qt] Build ${BUILD_DISPLAY_NAME}
${ghprbPullLink}
Name: ${ghprbPullTitle}
Commit: ${ghprbActualCommit}
${TEST_MESSAGE}
${TEST_LINK_MESSAGE}
Message: Build ${BUILD_STATUS} on Jenkins-CI ${BUILD_EMOJI} [/qt]
[/info]"

curl -X POST -H "X-ChatWorkToken: 9112736522e75af5198050e5a408ccb2" -d "body=${MESSAGE}&self_unread=0" "https://api.chatwork.com/v2/rooms/140166628/messages"
