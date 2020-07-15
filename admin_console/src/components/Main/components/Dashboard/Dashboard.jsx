import React, { Component } from "react";
import "./Dashboard.css";

export default class Dashboard extends Component {
  getCards = (name, number, percentage) => {
    const addCommasToNumber = number
      .toString()
      .replace(/\B(?=(\d{3})+(?!\d))/g, ",");

    let color = "#39dc00";
    let status = "Up";
    let icon = "trending_up";

    if (percentage === 0) {
      color = "#a3a3a3";
      status = "Change";
      icon = "linear_scale";
    } else if (percentage < 0) {
      color = "#ea3a3a";
      status = "Down";
      icon = "trending_down";
    }

    return (
      <div className="card">
        <div className="card-heading">{name}</div>
        <div className="card-number">{addCommasToNumber}</div>
        <div className="card-description">
          <span className="material-icons card-icon" style={{ color: color }}>
            {icon}
          </span>
          <span className="card-percentage" style={{ color: color }}>
            &nbsp;{Math.abs(percentage)}%
          </span>
          <span className="card-status">&nbsp;{status} from Yesterday</span>
        </div>
      </div>
    );
  };
  render() {
    const maxWidth = this.props.isSidebarOpen ? "280px" : "110px";
    console.log(this.props.isSidebarOpen, maxWidth);

    return (
      <div className="dashboard">
        <div
          className="card-flex-wrapper"
          style={{ maxWidth: `calc(100vw - ${maxWidth})` }}
        >
          <div className="card-container">
            {this.getCards("Total Transactions", 46289, 2.4)}
            {this.getCards("Total Users", 22544, 0.4)}
            {this.getCards("Total Groups", 11289, -1.4)}
            {this.getCards("Completed Pools", 33289, 0)}
          </div>
        </div>
      </div>
    );
  }
}
