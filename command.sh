#!/usr/bin/env bash

# REPO_URL https://github.com/tripp-ix/my-app

npx create-react-app my-app
cd my-app
git status
gh auth login
gh repo create my-app --public --source=. --remote=origin --push
git checkout -b update_logo
git add src/App.js
git commit -m "Update logo and link"
git push -u origin update_logo
gh pr create --base master --head update_logo --title "Update logo" --body "Replace the React logo and link with Propeller Aero branding."
gh pr merge --merge --delete-branch