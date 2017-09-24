import path from 'path';
import express from 'express';
import webpack from 'webpack';
import middleware from './src/middleware';
import bodyParser from 'body-parser';

const app = express();
app.use(bodyParser.json())

import ProxyLogin from './Proxy/Login';
import ProxySignup from './Proxy/Signup';
import ProxyPredictions from './Proxy/Predictions';
import ProxyPredicteds from './Proxy/Predicteds';

if(process.env.NODE_ENV === 'development') {
	const config = require('./webpack.config.dev');
	const compiler = webpack(config);
	app.use(require('webpack-dev-middleware')(compiler, {
		noInfo: true,
		publicPath: config.output.publicPath,
		stats: {
			assets: false,
			colors: true,
			version: false,
			hash: false,
			timings: false,
			chunks: false,
			chunkModules: false
		}
	}));
	app.use(require('webpack-hot-middleware')(compiler));
	app.use(express.static(path.resolve(__dirname, 'src')));
} else if(process.env.NODE_ENV === 'production') {
	app.use(express.static(path.resolve(__dirname, 'dist')));
}

app.post('/api/v1/signup', ProxySignup);
app.post('/api/v1/login', ProxyLogin);

app.get('/api/v1/predictions', ProxyPredictions);
app.get('/api/v1/predicteds', ProxyPredicteds);

app.get('*', middleware);

app.listen(3000, '0.0.0.0', (err) => {
	if(err) {
		console.error(err);
	} else {
		console.info('Listening at http://localhost:3000');	
	}
});
