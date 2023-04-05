# Carrying out Crypto investigations

----

## Detecting the use of cryptocurrencies 

First we need to locate evidence of cryptocurrency use, and then find the address or private keys that are being used by a suspect. 

As a refresher Bitcoin addresses start with the character 1 or 3, are 34 characters long, and are formatted as Base58

Ethereum addresses start with 0x and are 42 characters long.

Private keys are great to find. Bitcoin private keys can be in a number of formats. They may be in a standard 256-bit hex format and 64 characters long, a Wallet Import Format (WIF), 51 characters long, and start with the number 5. There is also a mini-private key format where the string is 21 characters long. Private keys can also be in the form of a string of mnemonic code words often called a seed.

Ethereum private keys are 64 characters long, Ethereum public keys are 42 characters long and start with 0x.

We can always start with questions if the opportunity presents itself. 

Do you use cryptocurrencies?, Which do you use (Bitcoin, Lite-coin, Ethereum)?, How do you store your private keys?, Do your private keys require passwords, and if so, what are they?, Where do you buy and sell your cryptocurrencies?, What are the passwords for those sites?, How much currency do you have?, What do you buy with cryptocurrency?

But that always doesn't provide fruit. We can also search Websites, forums, software-sharing sites, Twitter, other social media. 

We can use a regular expression to locate bitcoin address, 

`[13] 1-9A-HJ-NP-ZA-km-z](26,33}<`

## Extracting from computers

Usually when a computers arrive in the lab, the first thing to do is create a drive image. Various methods can be used, depends on what you're comfortable with. FTK imager can be used, alongside the regex from earlier, but you may get a lot of false positives with this when searching a hard drive. 

## Wallet files

A wallet contains everything you need to investigate Bitcoin usage, private keys, and addresses, records of transactions, and other metadata. You can look for wallet.dat file or similar.

## Automating the search

A researcher named Chris Cohen posted an excellent Python script to GitHub in 2014 called BTCscan, I've included the script and readme in the folder BTCscan.

BTCscan.py can be used on a drive image,

`BTCscan.py -i HD_01.dd` 

For a folder, 

`BTCscan.py -i="C:\ folder\"`

## Finding data in a memory dump

Once you have your memory dump, you can do a number of things to look for cryptocurrency artifacts, you can use the BTCscan tool, 

`BTCscan.py -i c:\temp\20230405.mem`

## Live computers

Don't forget to document the time you start to work on the computer, the computers time and the time on your watch. 

look whether any cryptocurrency tools are installed or running. If so, it would be great to extract a wallet file.

## Acquiring wallet files

one method is to create a batch file (for Windows) saved as walletfind.bat

`xcopy "%systemdrive%\walle*.dat" /s`

You can put this little script on a USB that you have in your kit.

We can also find any crypto programs installed, we can add to our script on a new line 

`WMIC product get name, version > installedapps.txt`

We can also add for programs that run directly from an executable, adding a new line to our script, 

`xcopy "%systemdrive%\*.exe" /s`

## Exporting from Bitcoin Daemon

Open a command shell and change to, 

C:\Program Files\Bitcoin\daemon

then type, 

`bitcoind`

minimize, don't close that shell.

open another cmd shell and got to, 

C:\Program Files\Bitcoin\daemon

run, 

`bitcoin-cli backupwallet <pathtoUSB>`

Some other useful commands that you can run, 

`bitcoin-cli walletinfo > walletinfo.txt`

Extract information on the network usage,

`bitcoin-cli getnettotals`

and, 

`bitcoin-cli getnetworkinfo`

and, 

`bitcoin-cli getpeerinfo`

list transactions, 

`bitcoin-cli listtransactions`

and, 

`bitcoin-cli list unspent`

let's create some scripts,

start_server.bat, and getdata.bat included in the Bitcoin folder.

create a folder at C:\temp before using the scripts. 

For Linux Bitcoin is installed in ~/.bitcoin/ 

and on MAC ~Library/Application Support/Bitcoin

You could make a shell script 

`find / -name wallet.dat -exec cp {} <path_to_USB> \;`

I've included a shell script for linux as well in Bitcoin folder.
