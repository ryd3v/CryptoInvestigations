#!/bin/sh

bitcoin-cli getwalletinfo > walletinfo.txt

bitcoin-cli getnettotals > nettotals.txt

bitcoin-cli getnetworkinfo > networkinfo.txt

bitcoin-cli getpeerinfo > peerinfo.txt

bitcoin-cli listtransactions * 1000 > transactions.txt

bitcoin-cli listunspent > unspent.txt

exit 0