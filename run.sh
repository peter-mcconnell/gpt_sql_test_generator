#!/bin/sh

# Install the requirements
pip install -r /requirements.txt

# Run the test generator script
python /scripts/test_generator.py
