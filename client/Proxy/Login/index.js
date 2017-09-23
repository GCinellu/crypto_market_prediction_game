import fetch from 'isomorphic-fetch';

export default (req, res) => {
  console.log('req.body', req.body);

  // fetch(url, { method: 'POST', body: credentials })
  //   .then( res => res.json() )
  //   .then(
  //       response => dispatch(receiveLogin(response)),
  //       error => dispatch(rejectLogin(error))
  //   );

  // request(url,
  //     (error, response, body) => {
  //       if (!error && response.statusCode === 200) {
  //         console.log(`Resolved request to ${url}`);
  //
  //         res.send(body);
  //       } else if (error) {
  //         console.log(`error in request to ${url}`, error);
  //
  //         res.send(`Error in the request: ${error}`);
  //       }
  //     });
};
