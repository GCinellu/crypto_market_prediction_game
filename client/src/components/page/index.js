import React from 'react';
import { Link } from 'react-router-dom';
import Header from '../topnav';
if(process.env.WEBPACK) require('./index.scss');

export default () => (
	<div className='page'>
		<Header title='Page' />
		<div>This is page 1</div>
		<img src='/assets/image.jpg' />
		<br />
		pippo<i className="fa fa-search" aria-hidden="true" />
		<Link to='/'>
			<button>Go to home</button>
		</Link>
	</div>
);
