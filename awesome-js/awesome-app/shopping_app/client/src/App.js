import { BrowserRouter as Router, Route } from 'react-router-dom';

import Home from './pages/home';
import Login from './pages/Login';
import Register from './pages/register';
import Item from './pages/item';

function App() {
  return (
    <Router>
      <Route exact path="/" component={Home} />
      <Route exact path="/login" component={Login} />
      <Route exact path="/register" component={Register} />
      <Route exact path="/item/:id" component={Item} />
    </Router>
  );
}

export default App;
