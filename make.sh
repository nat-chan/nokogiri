#!/bin/bash

# pip install wheel twine setuppy_generator
set -eux

python -m unittest discover

a=$(grep -oP "(?<=version=')\d*" setup.py)
b=$(grep -oP "(?<=version='\d.)\d*" setup.py)
c=$(grep -oP "(?<=version='\d.\d.)\d*" setup.py)

export SETUP_VERSION="${a}.${b}.$((c+1))"
export SETUP_URL="$(git remote -v|head -1|awk '{print $2}'|sed 's;git@github.com:;https://github.com/;')"

python -m setuppy_generator | tee setup.py
python setup.py bdist_wheel
twine upload --repository pypi dist/*
