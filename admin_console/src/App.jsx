import React, { Component } from "react";
import { BrowserRouter, Switch, Route } from "react-router-dom";
import { Dashboard, Login, NotFound } from "./components";

export default class App extends Component {
  render() {
    return (
      <BrowserRouter>
        <Switch>
          <Route exact path="/login" component={Login} />
          <Route exact path="/dashboard" component={Dashboard} />
          <Route path="*" component={NotFound} />
        </Switch>
      </BrowserRouter>
    );
  }
}
