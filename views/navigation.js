import { Navbar, Nav } from 'react-bootstrap'
import { NavItemLink } from 'react-router-bootstrap'

const Navigation = React.createClass({
  render() {
    return (
      <Navbar>
        <Nav>
          <NavItemLink to='/'>Home</NavItemLink>
        </Nav>
      </Navbar>
    );
  }
});

export default Navigation

