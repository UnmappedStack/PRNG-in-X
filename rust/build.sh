#!/bin/bash

set -e

rustc main.rs -o out

./out
