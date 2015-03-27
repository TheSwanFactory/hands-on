import { RouteHandler } from 'react-router'
import Navigation from './navigation'

const App = React.createClass({
  render() {
    return (
      <div>
        <Navigation />
        <div className='container'>
          <div className='content'>
            <RouteHandler />
          </div>
        </div>
      </div>
    );
  }
});

export default App
