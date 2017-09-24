import React from 'react';
import { connect } from 'react-redux';

import { Link } from 'react-router-dom';

import TopNav from '../topnav';

import Chart from '../charts/chart';
import Predictions from './../predictions';
import Predicteds from './../predicteds';

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
        <div className="row">
          <div className="col-sm-8">
            {/*<Chart data={data}*/}
            {/*/>*/}
          </div>

          <div className="col-sm-4">
            <div className="card">
              <div className="card-block">
                <h4 className="card-title">So you read the future?</h4>
                <hr/>
                <h6 className="card-subtitle mb-2 text-muted text-center">Is it going up or down?</h6>

                <div className="row">
                  <div className="col-sm-6">
                    <button className="btn btn-danger btn-lg btn-block">
                      Down
                    </button>
                  </div>
                  <div className="col-sm-6">
                    <button className="btn btn-success btn-lg btn-block">
                      Up
                    </button>
                  </div>
                </div>
                <br/>

                <h6 className="card-subtitle mb-2 text-muted text-center">How much?</h6>
                <div className="row">
                  <div className="col-sm-12">
                    <div className="input-group">
                      <input type="text" className="form-control" aria-label="Text input with dropdown button" />
                      <div className="input-group-btn">
                        <button type="button" className="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Absolute
                        </button>

                        <div className="dropdown-menu dropdown-menu-right">
                          <a className="dropdown-item" href="#">Relative</a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <br/>

                <h6 className="card-subtitle mb-2 text-muted text-center">In how long?</h6>
                <div className="row">
                  <div className="col-sm-6">
                    <div className="input-group">
                      <input type="date" className="form-control" aria-label="Text input with dropdown button" />
                    </div>
                  </div>

                  <div className="col-sm-6">
                    <div className="input-group">
                      <input type="time" className="form-control" aria-label="Text input with dropdown button" />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className="row">
          <div className="col-sm-12">
            <h4>Predictions</h4>
            <hr/>

            <Predictions />

            <br/>
            <h4>Predicteds</h4>
            <hr/>
            <Predicteds />
          </div>

        </div>
      </div>
    </div>
);

export default connect((state) => {
  const { user } = state;
  return { user: user.user };
})(Dashboard);
