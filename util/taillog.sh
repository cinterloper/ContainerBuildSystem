#!/bin/bash
docker $DKRGS exec -t -i $CTR bash -c "tail -f /tmp/RESTSH/$UUID"

