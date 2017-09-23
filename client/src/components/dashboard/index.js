import React from 'react';
import { connect } from 'react-redux';

import { Link } from 'react-router-dom';

import TopNav from '../topnav';

import Chart from '../charts/chart';
import Predictions from './../predictions';

if(process.env.WEBPACK) require('./index.scss');

const data = [
  { title: 'Terminator', value: 21, year: 1984 },
  { title: 'Commando', value: 81, year: 1985 },
  { title: 'Predator', value: 25, year: 1987 },
  { title: 'Raw Deal', value: 26, year: 1986 },
  { title: 'The Running Man', value: 11, year: 1987 },
  { title: 'Total Recall', value: 44, year: 1990 },
  { title: 'Terminator 2', value: 0, year: 1991 },
  { title: 'Last Action Hero', value: 22, year: 1993 },
  { title: 'True Lies', value: 51, year: 1994 },
  { title: 'Eraser', value: 29, year: 1996 },
  { title: 'Terminator 3', value: 2, year: 2003 },
];


const Dashboard = ({ user }) => (
    <div className='page'>
      <TopNav title='Page' />
      <br/>


      <div className="container">
        <h1 className="text-center">
          Welcome to your dashboard {user.username}
        </h1>

        <hr />

        <div className="row">
          <div className="col-sm-8">
            <Chart data={data}
            />
          </div>

          <div className="col-sm-4">
            <div className="card">
              <div className="card-block">
                <h4 className="card-title">Card title</h4>
                <h6 className="card-subtitle mb-2 text-muted">Card subtitle</h6>
                <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" className="card-link">Card link</a>
                <a href="#" className="card-link">Another link</a>
              </div>
            </div>
          </div>
        </div>

        <div className="row">
          <div className="col-sm-12">
            <h4>Predictions</h4>
            <hr/>

            <Predictions />
          </div>

        </div>
      </div>
    </div>
);

export default connect((state) => {
  const { user } = state;
  return { user: user.user };
})(Dashboard);
