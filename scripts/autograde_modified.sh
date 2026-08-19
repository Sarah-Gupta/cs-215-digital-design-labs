#!/usr/bin/env bash
# Classroom 50 Dynamic Autograder for Hidden Test Cases.
# Detects which lab files were modified in the commit, and executes
# the corresponding hidden testbenches.

set -e

echo "🔍 Detecting modified labs..."

# Get list of modified files in the last commit
# If this is the initial commit or has no parent, compare against empty tree
if git rev-parse HEAD~1 >/dev/null 2>&1; then
  MODIFIED_FILES=$(git diff --name-only HEAD~1 HEAD)
else
  MODIFIED_FILES=$(git show --name-only --format="" HEAD)
fi

echo "Modified files in this submission:"
echo "$MODIFIED_FILES"
echo "----------------------------------"

# Extract unique lab names (e.g., lab01, lab02) from the modified files path
LABS_TO_GRADE=$(echo "$MODIFIED_FILES" | grep -E '^labs/lab[0-9]{2}/' | cut -d'/' -f2 | sort -u || true)

if [ -z "$LABS_TO_GRADE" ]; then
  echo "ℹ No lab files were modified. Defaulting to grading lab01."
  LABS_TO_GRADE="lab01"
fi

FAILED=0

for LAB in $LABS_TO_GRADE; do
  echo "🚀 Grading $LAB..."
  
  # Every lab has 4 tasks
  for TASK_NUM in {1..4}; do
    TASK="task${TASK_NUM}"
    HIDDEN_TB=".hidden-tests/${LAB}/hidden_tb_${TASK}.v"
    
    # Check if the hidden testbench exists for this task
    if [ -f "$HIDDEN_TB" ]; then
      echo "----------------------------------"
      echo "Testing ${LAB} ${TASK} against hidden testbench..."
      echo "----------------------------------"
      
      # Run test runner and capture result
      set +e
      ./scripts/test_runner.sh "$LAB" "$TASK" "$HIDDEN_TB"
      RESULT=$?
      set -e
      
      if [ $RESULT -ne 0 ]; then
        echo "❌ ${LAB} ${TASK} FAILED hidden test cases!"
        FAILED=1
      else
        echo "✔ ${LAB} ${TASK} PASSED hidden test cases!"
      fi
    else
      echo "ℹ Skipping ${LAB} ${TASK} (No hidden testbench found at $HIDDEN_TB)."
    fi
  done
done

if [ $FAILED -ne 0 ]; then
  echo "❌ Autograding completed: Some tests FAILED."
  exit 1
else
  echo "🎉 Autograding completed: All tests PASSED!"
  exit 0
fi
