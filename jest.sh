#!/usr/bin/env bash

#ENABLE/DISABLE
IS_ENABLE=false

if [ "$IS_ENABLE" = false ] ; then
    echo ":star: Jest"
    echo "---"
    echo "Enable extension | bash='sed -i s/^IS_ENABLE=false$/IS_ENABLE=true/ ~/.config/argos/jest.sh' terminal=false"
    exit 0
fi

# JEST REPORTS PATH
TEST_REPORT_PATH=$(echo ~/.config/argos/test-result.json)
COVERAGE_REPORT_PATH=$(echo ~/.config/argos/coverage-summary.json)

#EMOJIS
SUCCESS_ICON=":four_leaf_clover:"
ERROR_ICON=":red_circle:"
LINES_PCT_ICON=":panda_face:"
STATEMENTS_PCT_ICON=":smiley_cat:"
FUNCTIONS_PCT_ICON=":smirk_cat:"
OPEN_REPORT_ICON=":page_facing_up:"
WARNING_ICON=":warning:"
DOCS_ICON=":books:"

if [ ! -f "$TEST_REPORT_PATH" ]; then
  echo ":star: Jest"
  echo "---"
  echo "$WARNING_ICON Missing test report file"
  echo "$DOCS_ICON Click to open docs | href='https://github.com/LuisReinoso/jest-argos-gnome-extension'"
  exit 0
fi

if [ ! -f "$COVERAGE_REPORT_PATH" ]; then
  echo ":star: Jest"
  echo "---"
  echo "$WARNING_ICON Missing coverage summary file"
  echo "$DOCS_ICON Click to open docs | href='https://github.com/LuisReinoso/jest-argos-gnome-extension'"
  exit 0
fi

# JEST REPORTS PARSE
SUCCESS_FLAG=$(cat $TEST_REPORT_PATH | jq '.success')
FAIL_TESTS=$(cat $TEST_REPORT_PATH | jq '.numFailedTests')
SUCCESS_TESTS=$(cat $TEST_REPORT_PATH | jq '.numPassedTests')

LINES_PCT=$(cat $COVERAGE_REPORT_PATH | jq '.total.lines.pct')
STATEMENTS_PCT=$(cat $COVERAGE_REPORT_PATH | jq '.total.statements.pct')
FUNCTIONS_PCT=$(cat $COVERAGE_REPORT_PATH | jq '.total.functions.pct')

# OUTPUT
TESTS="$SUCCESS_ICON Success $SUCCESS_TESTS"

if [[ $SUCCESS_FLAG != "true" ]]; then
  TESTS="$ERROR_ICON $FAIL_TESTS"
fi

echo $TESTS
---
if [[ $FAIL_TESTS -eq 0 ]]; then
  echo "$LINES_PCT_ICON Lines %" "${LINES_PCT}"
  echo "$STATEMENTS_PCT_ICON Statements %" $STATEMENTS_PCT
  echo "$FUNCTIONS_PCT_ICON Functions %" $FUNCTIONS_PCT
fi
echo "---"
echo "$OPEN_REPORT_ICON Open report | bash='xdg-open ~/.config/argos/index.html' terminal=false"
echo "---"
echo "Disable extension | bash='sed -i s/^IS_ENABLE=true$/IS_ENABLE=false/ ~/.config/argos/jest.sh' terminal=false"

