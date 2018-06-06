#!/bin/bash
set -e

install() {
    pip3 install -r requirements.txt
}

tests() {
    python3 -m unittest discover tests
}

run() {
    python3 src/example.py
}

case "$1" in
"install")
    echo "Install"
    install
    ;;
"tests")
    echo "Tests"
    tests
    ;;
"run")
    echo "Run"
    run
    ;;
*)
    echo "Custom command : $@"
    exec "$@"
    ;;
esac