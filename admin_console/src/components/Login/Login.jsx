import React, { Component } from "react";
import logo from "../../NewLogo.svg";
import "./Login.css";

class Login extends Component {
  constructor() {
    super();

    this.state = {
      username: "",
      password: "",
    };
  }

  handleChange = (event) => {
    const { name, value } = event.target;
    this.setState({
      [name]: value,
    });
  };

  handleSubmit = (event) => {
    event.preventDefault();
    console.log(
      `username:${this.state.username}\npassword:${this.state.password}`
    );
  };

  render() {
    return (
      <div className="Login">
        <div className="login-logo">
          <img src={logo} alt="Logo" />
        </div>

        <form
          className="login-card"
          onSubmit={(event) => this.handleSubmit(event)}
        >
          <div className="login-title">
            <div className="login-title-heading">Admin</div>
            <div className="login-title-description">
              Login To Access Your Dashboard
            </div>
          </div>

          <div className="login-input-container">
            <input
              type="text"
              name="username"
              className="login-input"
              required={true}
              onChange={(event) => this.handleChange(event)}
            />
            <label htmlFor="username" className="login-label">
              <span className="login-input-name">Username</span>
            </label>
          </div>

          <div className="login-input-container">
            <input
              type="password"
              name="password"
              className="login-input"
              required={true}
              onChange={(event) => this.handleChange(event)}
            />
            <label htmlFor="password" className="login-label">
              <span className="login-input-name">Password</span>
            </label>
          </div>

          <button className="forgot-password">Forgot Password?</button>
          <button className="login-button">Login</button>
        </form>
      </div>
    );
  }
}

export default Login;
