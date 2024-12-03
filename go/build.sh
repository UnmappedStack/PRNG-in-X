#!/bin/bash

set -e

go build -o out main.go

./out
