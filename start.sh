#!/usr/bin/env bash

vagrant up
ansible-playbook  prod-server.yml
