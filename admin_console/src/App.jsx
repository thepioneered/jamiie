import React, { Component } from "react";
import { BrowserRouter, Switch, Route } from "react-router-dom";
import { Admin, Login, NotFound } from "./components";

export default class App extends Component {
  componentDidMount = () => {
    window.addEventListener("storage", this.syncLogout);
  };

  syncLogout = (event) => {
    if (event.key === "logout") {
      console.log("logged out from storage!", this.props);
    }
  };

  render() {
    return (
      <BrowserRouter>
        <Switch>
          <Route exact path="/login" component={Login} />
          <Route exact path="/dashboard" component={Admin} />
          <Route path="*" component={NotFound} />
        </Switch>
      </BrowserRouter>
    );
  }
}
