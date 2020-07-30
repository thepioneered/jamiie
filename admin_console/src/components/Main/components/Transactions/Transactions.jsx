import React, { Component } from "react";
import call from "../../call";

class Transactions extends Component {
  state = { loading: true, data: "" };

  componentDidMount = async () => {
    const result = await call.callServer("transactions");
    this.setState({
      loading: false,
      data: result,
    });
  };

  render() {
    if (this.state.loading) {
      return <div>Loading...</div>;
    }
    return (
      <div>
        <div>{this.state.data}</div>
      </div>
    );
  }
}

export default Transactions;
