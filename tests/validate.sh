#!/bin/bash
# Simple validation tests for NovaTech Portal

PASS=0; FAIL=0

echo "=== NovaTech Portal — Tests ==="

echo -n "TEST 1: index.html exists... "
if [ -f "index.html" ]; then echo "✅"; PASS=$((PASS+1)); else echo "❌"; FAIL=$((FAIL+1)); fi

echo -n "TEST 2: index.html has <title>... "
if grep -q "<title>" index.html 2>/dev/null; then echo "✅"; PASS=$((PASS+1)); else echo "❌"; FAIL=$((FAIL+1)); fi

echo -n "TEST 3: style.css exists... "
if [ -f "style.css" ]; then echo "✅"; PASS=$((PASS+1)); else echo "❌"; FAIL=$((FAIL+1)); fi

echo -n "TEST 4: config.json is valid... "
if python3 -c "import json; json.load(open('config.json'))" 2>/dev/null; then echo "✅"; PASS=$((PASS+1)); else echo "❌"; FAIL=$((FAIL+1)); fi

echo ""
echo "Results: $PASS passed, $FAIL failed"
[ $FAIL -gt 0 ] && exit 1 || exit 0
