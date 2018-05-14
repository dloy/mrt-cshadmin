#!/bin/bash
curl -X GET  \
    http://oneshare-test.unm.edu:8080/cloudhost/state/8101?t=xml&forceTest=$1
