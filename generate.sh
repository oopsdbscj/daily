#!/bin/bash -e

pre() {
  local count=$(ls -1 scripts/pre/*.sh 2>/dev/null | wc -l)
  if [ $count == 0 ]; then
    return
  fi

  for file in scripts/pre/*.sh; do
    "$file"
  done
}

post() {
  local count=$(ls -1 scripts/post/*.sh 2>/dev/null | wc -l)
  if [ $count == 0 ]; then
    return
  fi

  for file in scripts/post/*.sh
  do
    "$file"
  done
}

run() {
  # advertisement list
  scripts/adlist/adlist.sh

  # gfw domain list
  scripts/gfwlist/gfwlist.sh

  # china domain list
  scripts/chinalist/chinalist.sh

  # alexa top list
  scripts/alexa/alexa.sh

  # ------------------------------ #

  # adblock
  scripts/adblock/adblock.sh

  # blacklist
  scripts/blacklist/blacklist.sh

  # chnroute
  scripts/chnroute/chnroute.sh

  # safelist
  scripts/safelist/safelist.sh

  # pac
  scripts/pac/gfwlist.sh
  scripts/pac/whitelist.sh

  # shadowrocket
  scripts/shadowrocket/gfwlist.sh
  scripts/shadowrocket/whitelist.sh
}

pre
run
post
