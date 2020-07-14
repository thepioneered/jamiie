import React, { Component } from "react";
import "./Dashboard.css";

export default class Dashboard extends Component {
  getCards = () => {
    let x = 46289;
    const y = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return (
      <div className="card">
        <div className="card-heading">Total Transactions</div>
        <div className="card-number">{y}</div>
        <div className="card-description">
          <span className="material-icons card-icon">trending_up</span>
          <span className="card-percentage">&nbsp;2.4%</span>
          <span className="card-status">&nbsp;Up from Yesterday</span>
        </div>
      </div>
    );
  };
  render() {
    return (
      <div className="dashboard">
        <div className="card-flex-wrapper">
          <div className="card-container">
            {this.getCards()}
            {this.getCards()}
            {this.getCards()}
            {this.getCards()}
          </div>
        </div>
      </div>
    );
  }
}
