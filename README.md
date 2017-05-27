# firetor
Stupid script to torify firejail's sandboxes

## Usage

`./firetor.sh [--firejail opts] exec `

Example:

` ./firetor.sh --caps.drop=all curl https://3g2upl4pq6kufc4m.onion/ `

## Dependecies

You need `firejail` , `bridge-utils` and an instance of Tor configured as in `torrc.example`
