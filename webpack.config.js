const path = require('path');

module.exports = {
  entry: './src/index.js',

  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'bundle.js'
  },

  module: {
    rules: [
      {
        test: /\.elm/,
        use: [
          {
            loader: 'elm-webpack-loader',
            options: {
              verbose: true,
              warn: true
            }
          }
        ]
      }, {
        test: /\.html$/,
        use: [
          'file-loader?name=[name].[ext]'
        ]
      }, {
        test: /\.css$/,
        use: [
          'style-loader',
          'css-loader?importLoaders=1',
          'postcss-loader'
        ]
      }
    ]
  },

  devServer: {
    inline: true,
    stats: {
      colors: true
    },
    clientLogLevel: 'info',
    contentBase: path.join(__dirname, 'public'),
  }
}
