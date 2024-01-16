#!/bin/bash

# Nazwy playbooków
PLAYBOOKS=("p1.yml" "p2.yml" "pe1.yml" "pe2.yml")

# Iteracja po wszystkich playbookach
for playbook in "${PLAYBOOKS[@]}"
do
    echo "Running playbook: $playbook"
    ansible-playbook ansible/$playbook
    echo "Completed playbook: $playbook"
done