# Some useful tools for a developer when working with bitcoin transaction

## Books

[Mastering Bitcoin](https://github.com/bitcoinbook/bitcoinbook) is a book for developers, although the first two chapters cover bitcoin at a level that is also approachable to non-programmers. Anyone with a basic understanding of technology can read the first two chapters to get a great understanding of bitcoin.

https://www.amazon.com/Mastering-Bitcoin-Programming-Open-Blockchain/dp/1491954388

## How to create a new testnet wallet ?!

https://counterwallet-testnet.coindaddy.io/#pages/balances.html

## How to get free Bitcoin testnet ?!

https://testnet.manu.backend.hamburg/faucet

## How to track bitcoin transactions, addresses ?!

https://testnet.blockchain.info/
https://live.blockcypher.com/bcy/
https://www.blocktrail.com/tBTC
https://testnet.blockexplorer.com/

## How to get a raw transaction from tx hash ?!

https://testnet.blockexplorer.com/api/rawtx/<tx_hash>
https://testnet.blockchain.info/tx/<tx_hash>?format=hex

## How to get json format informations of the transaction ?

https://testnet.blockchain.info/tx/<tx_hash>?format=json
https://api.blockcypher.com/v1/btc/test3/txs/<tx_hash>?includeHex=true

## How to decode a raw hex of tx ?!

https://live.blockcypher.com/bcy/decodetx

## How to broadcast your transaction online ?!

https://live.blockcypher.com/btc/pushtx/

## How to get current Bitcoin transaction fee predictions in JSON format

https://bitcoinfees.earn.com/api

```
{ "fastestFee": 40, "halfHourFee": 20, "hourFee": 10 }
```

## Bitcoind commandline

https://github.com/taariq/bitcoind-simple-send

## Useful gems

- [bitcoin-ruby](https://github.com/lian/bitcoin-ruby) This is a ruby library for interacting with the bitcoin protocol/network.
- [money-tree) BIP32](https://github.com/GemHQ/money-tree) A Ruby implementation of Bitcoin HD Wallets (Hierarchical Deterministic.
- [katapaty](https://github.com/longhoangwkm/katapaty) A ruby gem for communicating with a Counterparty (BTC/ XCP) API server

## Examples

