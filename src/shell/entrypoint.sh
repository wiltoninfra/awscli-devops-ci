#!/usr/bin/env bash
set -e
set -o pipefail

sh /auth.sh

bash -c "set -e;  set -o pipefail; $@"
