#!/bin/bash
# Setup trifecta configuration
mkdir .trifecta
chmod a+x setup.sh
mv setup.sh .trifecta/
mv config.properties .trifecta/
cd .trifecta
sh setup.sh

# Start ui
cd ..
bin/trifecta_ui

