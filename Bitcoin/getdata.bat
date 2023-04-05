cd "%systemdrive%\program files\bitcoin\daemon"

bitcoin-cli getwalletinfo > c:\temp\walletinfo.txt

bitcoin-cli getnettotals > c:\temp\nettotals.txt

bitcoin-cli getnetworkinfo > c:\temp\networkinfo.txt

bitcoin-cli getpeerinfo > c:\temp\peerinfo.txt

bitcoin-cli listtransactions "*" 1000 > c:\temp\transactions.txt

bitcoin-cli listunspent > c:\temp\unspent.txt