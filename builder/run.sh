#!/usr/bin/env bash
cd /workspace

curl -sSL https://download.srcclr.com/ci.sh | sh
npm install --quiet
