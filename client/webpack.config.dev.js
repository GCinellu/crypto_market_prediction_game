const path = require('path');
const webpack = require('webpack');
const autoprefixer = require('autoprefixer');

module.exports = {
  devtool: 'source-map',
	entry: [
		'webpack-hot-middleware/client',
		path.resolve(__dirname, 'src')
	],
	output: {
		path: path.resolve(__dirname, 'src'),
		filename: 'bundle.js',
		publicPath: '/'
	},
	plugins: [
		new webpack.HotModuleReplacementPlugin(),
		new webpack.NamedModulesPlugin(),
		new webpack.DefinePlugin({
			'process.env': {
				NODE_ENV: JSON.stringify('development'),
				WEBPACK: true
			}
		})
	],
	module: {
		loaders: [
			{
				test: /\.js$/,
				use: {
					loader: 'babel-loader',
					query: {
						presets: [ 'react-hmre' ]
					}
				},
				include: path.resolve(__dirname, 'src'),
			},
			{
				test: /\.scss/,
				use: [
					'style-loader',
          {
            loader:'css-loader',
            options: {
              alias: {
                bootstrap: 'src/assets/vendors/bootstrap.min.css'
              }
            }
          },
					'sass-loader',
					{
						loader: 'postcss-loader',
						options: {
							plugins: function() {
                return [
                  require('autoprefixer')
                ];
              }
						}
					},
          {
            loader: 'sass-resources-loader',
            options: {
              // Provide path to the file with resources
              resources: './src/assets/styles/index.scss'
            },
          }
				],
				include: path.resolve(__dirname, 'src')
			},
      {
        test: /.jpe?g$|.gif$|.png$|.svg$|.woff$|.ttf$|.wav$|.mp3$|.eot$|.woff2$/,
        loader: require.resolve('file-loader') + '?name=[path][name].[ext]'
      }
		]
	}
};
