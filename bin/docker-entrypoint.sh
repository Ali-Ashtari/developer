#!/bin/bash
set -e

# activate python2 environment
source activate python2

# only download workshop materials if default command has not been overridden
if [ $1 = "start-notebook.sh" ]; then
  if [ ! -f ~/work/satellites-predictive.ipynb ]; then
    wget --progress=dot:giga -O - https://${CONTENT_URL} | gunzip -c | tar xf - -C ~/work
  fi
fi
bash -c "cd bayeslite && python setup.py install"

exec "$@"
