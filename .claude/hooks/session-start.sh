#!/bin/bash
set -euo pipefail

# Only run in remote (Claude Code on the web) environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-$(pwd)}"

echo "Installing npm dependencies..."
npm install

echo "Installing Playwright browsers..."
if npx playwright install --with-deps chromium; then
  echo "Playwright browsers installed successfully."
else
  echo "Warning: Playwright browser install failed. Browsers may need to be installed manually."
fi

echo "Session start setup complete."
