import { BrowserRouter as Router, Route } from "react-router-dom";
import { AuthProvider } from "./context/auth";
import { Container } from "@material-ui/core";

import AuthRoute from "./utils/AuthRoute";
import Home from "./pages/home";
import Login from "./pages/login";
import Register from "./pages/register";
import Item from "./pages/item";

import MenuBar from "./components/MenuBar";

function App() {
  return (
    <AuthProvider>
      <Router>
        <MenuBar />
        <Container>
          <Route exact path="/" component={Home} />
          <AuthRoute exact path="/login" component={Login} />
          <AuthRoute exact path="/register" component={Register} />
          <Route exact path="/item/:id" component={Item} />
        </Container>
      </Router>
    </AuthProvider>
  );
}

export default App;
