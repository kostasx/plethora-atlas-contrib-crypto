colors = require 'colors'
path   = require 'path'
fs 	   = require 'fs'
rp 	   = require 'request-promise'

CRYPTO =

	getBchAddress: (options)->

		rp({ uri: "https://blockdozer.com/insight-api/addr/#{options.address}", json: true })

	getTokenPrice: (options)->

		rp({ uri: "https://api.coinmarketcap.com/v1/ticker/#{options.token}/", json: true })

module.exports = CRYPTO