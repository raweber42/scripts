#!/bin/bash

# Function to compare develop and staging overlays
compare_overlays() {
    local service_dir="$1"
    diff "${service_dir}overlays/staging" "${service_dir}overlays/production"
}

# Find all directories in the current directory and run the comparison
for dir in */; do
    if [[ -d "$dir/overlays/staging" ]] && [[ -d "$dir/overlays/production" ]]; then
        echo -e "\n### Comparing overlays for $dir"
        compare_overlays "$dir"
    else
        echo -e "\n### Skipping $dir because it does not contain both staging and production overlays."
    fi
done
