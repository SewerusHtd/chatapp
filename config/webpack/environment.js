const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
    environment.plugins.append('Provide', new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery'
}))

module.exports = environment
const coffee = require('./loaders/coffee')

environment.loaders.append('coffee', coffee)
environment.loaders.prepend('coffee', require('./loaders/coffee'))
