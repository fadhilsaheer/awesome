import { BrowserRouter as Router, Route } from 'react-router-dom';

import Join from './components/Join';
import Chat from './components/Chat';

const App = () => {
    return (
        <Router>
            <Route path="/" exact component={Join} />
            <Route path="/chat" component={Chat} />
        </Router>
    );
}
 
export default App;