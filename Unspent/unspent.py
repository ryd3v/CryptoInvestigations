import json
import requests
from pip._vendor.distlib.compat import raw_input

address = str(raw_input("Enter the bitcoin address? "))

f = open('unspent_%s.txt' % address, 'w')

resp = requests.get('https://blockchain.info/unspent?active=%s' % address)

utxo_set = json.loads(resp.text)["unspent_outputs"]

f.write('TX_ID TX_Number Amount' + '\n' + '\n')

for utxo in utxo_set:
    f.write("%s %d %ld Satoshis" % (utxo['tx_hash_big_endian'], utxo['tx_output_n'], utxo['value']) + '\n')

f.write('\n' + '\n')

f = open('balance_%s.txt' % address, 'w')

balance = requests.get('https://blockchain.info/balance?active=%s' % address)

for line in balance:
    f.write(str(line) + '\n'),
    print("Check txt file..")
