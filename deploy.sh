# Trigger mupx deploy if current branch is 'prod'

#!/bin/bash

echo "On branch '$TRAVIS_BRANCH'."

if [ "$TRAVIS_BRANCH" == "prod" ]; then
  echo "Triggering Mup deployment..."
  mup deploy
else
  echo "Not deploying. Use 'prod' branch to deploy."
fi
