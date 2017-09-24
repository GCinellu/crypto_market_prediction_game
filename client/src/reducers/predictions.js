const initialState = {
  isDefaultState: true,
  isFetching: false,
  isRejected: false,

  predictions: {}
};

export default (state = initialState, action) => {
  switch (action.type) {
    case 'REQUEST_PREDICTIONS':
      return Object.assign({}, state, {
        isDefaultState: true,
        isFetching: true,
        isRejected: false,
      });

    case 'RECEIVE_PREDICTIONS':
      return Object.assign({}, {
        isDefaultState: false,
        isFetching: false,
        isRejected: false,

        predictions: action.predictions
      });

    case 'REJECT_PREDICTIONS':
      return Object.assign({}, state, {
        isDefaultState: true,
        isFetching: false,
        isRejected: true,

        error: action.error
      });

    default:
      return state;
  }
};
