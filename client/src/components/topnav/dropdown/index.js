import React from 'react';

// TODO: finish dropdown
const cssDropdownVisible = {

}

export default ({ categoryName }) => (
    <li className="nav-item dropdown">
      <a className="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        { categoryName }
      </a>

      <div className="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
        <a className="dropdown-item" href="#">
          Action
        </a>

        <a className="dropdown-item" href="#">
          Another action
        </a>

        <a className="dropdown-item" href="#">
          Something else here
        </a>
      </div>
    </li>
);
