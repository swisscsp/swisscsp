#!/bin/bash
# Local preview of the site — no changes to your shell setup (.zshrc).
#  - Uses Homebrew's Ruby 3.3, which is "keg-only": it sits beside macOS's own
#    Ruby and is NOT put on your PATH; this script uses it only while it runs.
#  - Gems are installed into ./vendor/bundle inside this folder, not system-wide.
# Usage:  ./serve.sh        then open http://localhost:4000
set -e
cd "$(dirname "$0")"

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Install it from https://brew.sh first." >&2
  exit 1
fi

RUBY_PREFIX="$(brew --prefix ruby@3.3 2>/dev/null || true)"
if [ ! -x "$RUBY_PREFIX/bin/ruby" ]; then
  echo "Installing Ruby 3.3 for this project (macOS's own Ruby is left alone)…"
  brew install ruby@3.3
  RUBY_PREFIX="$(brew --prefix ruby@3.3)"
fi

export PATH="$RUBY_PREFIX/bin:$PATH"     # only for this script
echo "Using $(ruby -v)"

bundle config set --local path vendor/bundle
bundle install
exec bundle exec jekyll serve "$@"
