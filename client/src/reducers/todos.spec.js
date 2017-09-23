import reducer from './todos';

const initialState = [
  { id: 1, text: 'Todo 1', checked: false },
  { id: 2, text: 'Todo 2', checked: false },
  { id: 3, text: 'Todo 3', checked: false }
];

describe('todos reducer', () => {
  it('should return the initial state', () => {
    expect(reducer(undefined, {}))
        .toEqual(initialState);
  });

  it('should handle TOGGLE_TODO', () => {
    let newState = initialState.slice(0); // clone the array
    newState[0].checked = !newState[0].checked;

    expect(
        reducer(initialState, {
          type: 'TOGGLE_TODO',
          id: 1
        })
    ).toEqual(newState);
  });

  it('should just return the initialState in any other case', () => {
    expect(
        reducer(initialState, {
          type: 'INVALID_ACTION',
          id: 4
        })
    ).toEqual(initialState);
  });
});