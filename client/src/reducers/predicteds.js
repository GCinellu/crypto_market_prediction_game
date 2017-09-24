const initialState = {
  isDefaultState: true,
  isFetching: false,
  isRejected: false,

  predicteds: {}
};

export default (state = initialState, action) => {
  switch (action.type) {
    case 'REQUEST_PREDICTEDS':
      return Object.assign({}, state, {
        isDefaultState: true,
        isFetching: true,
        isRejected: false,
      });

    case 'RECEIVE_PREDICTEDS':
      return Object.assign({}, {
        isDefaultState: false,
        isFetching: false,
        isRejected: false,

        predicteds: action.predicteds
      });

    case 'REJECT_PREDICTEDS':
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
