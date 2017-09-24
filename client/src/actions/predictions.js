import fetch from 'isomorphic-fetch';

function requestPredictions() {
  return {
    type: 'REQUEST_PREDICTIONS'
  }
}

export function receivePredictions(json) {
  return {
    type: 'RECEIVE_PREDICTIONS',
    predictions: json
  };
}

function rejectPredictions(error) {
  return {
    type: 'REJECT_PREDICTIONS',
    error
  };
}

export const fetchPredictions = (user) => {
  return dispatch => {
    if(!user) {
      return dispatch(rejectPredictions({ error: "You need to send a user" }))
    }

    dispatch(requestPredictions());

    const headers = new Headers();
    headers.append('Accept', 'application/json');
    headers.append('Content-Type', 'application/json');
    headers.append('Auth-Token', user.token);

    const options = {
      method: 'GET',
      headers: headers,
    };

    return fetch(`http://localhost:3000/api/v1/predictions`, options)
        .then( (res) => {
          return res.json();
        })
        .then(
            (response) => {
              return dispatch(receivePredictions(response));
            }
        )
  };
}
