const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
);

environment.config.merge({
  resolve: {
    alias: {
      'jquery': 'jquery-ui-dist/external/jquery/jquery.js',
      'jquery-ui': 'jquery-ui-dist/jquery-ui.js'
    }
  }
});
module.exports = environment
