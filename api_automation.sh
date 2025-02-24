#!/bin/bash


sed -i '/^[[:space:]]*telegram api *= *\[\][[:space:]]*$/s/\[\]/[YOUR_API_KEY]/' config
