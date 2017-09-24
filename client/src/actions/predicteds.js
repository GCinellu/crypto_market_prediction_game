import fetch from 'isomorphic-fetch';

function requestPredicteds() {
  return {
    type: 'REQUEST_PREDICTEDS'
  }
}

export function receivePredicteds(json) {
  return {
    type: 'RECEIVE_PREDICTEDS',
    predicteds: json
  };
}

function rejectPredicteds(error) {
  return {
    type: 'REJECT_PREDICTEDS',
    error
  };
}

export const fetchPredicteds = (user) => {
  return dispatch => {
    if(!user) {
      return dispatch(rejectPredicteds({ error: "You need to send a user" }))
    }

    dispatch(requestPredicteds());

    const headers = new Headers();
    headers.append('Accept', 'application/json');
    headers.append('Content-Type', 'application/json');
    headers.append('Auth-Token', user.token);

    const options = {
      method: 'GET',
      headers: headers,
    };

    return fetch(`http://localhost:3000/api/v1/predicteds`, options)
        .then( (res) => {
          return res.json();
        })
        .then(
            (response) => {
              return dispatch(receivePredicteds(response));
            }
        )
  };
}
