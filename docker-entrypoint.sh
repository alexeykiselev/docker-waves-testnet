#!/bin/bash

if [ ! -f /waves/waves-testnet.json ]; then
	echo "Configuration file not found. Initializing..."

	mkdir /waves/data /waves/wallet

	cd /build
	source ./bitcoin-bash-tools/bitcoin.sh
	export NEWSEED=`newBitcoinKey | grep address | cut -c 27- | head -1`
	echo "New seed: $NEWSEED"

	sed "s/\"walletSeed\": \"\",/\"walletSeed\": \"$NEWSEED\",/g;s+/tmp/scorex++g;s/127.0.0.1/0.0.0.0/g" /build/waves-testnet.json > /waves/waves-testnet.json

	mv /build/waves.jar /waves/

	cat /waves/waves-testnet.json
fi

cd /waves

java -jar waves.jar waves-testnet.json
