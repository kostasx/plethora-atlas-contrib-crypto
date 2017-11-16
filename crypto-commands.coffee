colors    = require 'colors'
BigNumber = require 'bignumber.js'
Table     = require 'cli-table'

tablePrint = (data)->

  table = new Table()
  Object.keys(data).map (entry)-> 
  	table.push([entry, data[entry] && data[entry] || "" ])
  console.log table.toString()

initCommands = (program)->

	program
		.command('crypto')
		.description('Cryptocurrency Swiss Army Knife')
		.option('--get-token-price <token>', 'Get token price from coinmarketcap.com: $ atlas crypto --get-token-price trueflip')
		.option('--get-bch-address <address>','Get Bitcoin Cash Address Info')
		.action (options) ->

			CRYPTO = require('./crypto')

			if options.getBchAddress
				return CRYPTO.getBchAddress({ address: options.getBchAddress })
				.then(console.log)
				.catch(console.log)

			if options.getTokenPrice
				CRYPTO.getTokenPrice({ token: options.getTokenPrice })
				.then((res)-> console.log tablePrint(res[0]))
				.catch(console.log)

module.exports = initCommands