import React, { Component } from "react";
import { Dashboard, Transactions, Groups, Users } from "./components/";
import "./Main.css";
import { Switch, Route, withRouter } from "react-router-dom";

class Main extends Component {
  render() {
    const path = this.props.location.pathname;
    console.log(path);
    return (
      <div className="Main">
        <Switch>
          <Route
            exact
            path={path}
            render={(routerProps) => (
              <Dashboard
                isSidebarOpen={this.props.isSidebarOpen}
                routerProps={routerProps}
              />
            )}
          />

          <Route path={`${path}/transactions`}>
            <Transactions isSidebarOpen={this.props.isSidebarOpen} />
          </Route>
          <Route path={`${path}/groups`}>
            <Groups isSidebarOpen={this.props.isSidebarOpen} />
          </Route>
          <Route path={`${path}/users`}>
            <Users isSidebarOpen={this.props.isSidebarOpen} />
          </Route>
        </Switch>
      </div>
    );
  }
}

export default withRouter(Main);
