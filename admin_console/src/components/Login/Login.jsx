import React, { Component } from "react";
import logo from "../../NewLogo.svg";
import "./Login.css";

class Login extends Component {
  constructor() {
    super();

    this.usernameInput = React.createRef();

    this.state = {
      username: "",
      password: "",
      wrongLogin: 0,
      wrongDivClassName: "wrong-login",
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

    const w = true;

    if (w) {
      if (this.state.wrongLogin > 0) {
        this.setState({
          wrongLogin: this.state.wrongLogin + 1,
          wrongDivClassName: "wrong-login wrong-login-show double-wrong",
        });
        setTimeout(
          () =>
            this.setState({
              wrongDivClassName: "wrong-login wrong-login-show",
            }),
          600
        );
      } else {
        this.setState({
          wrongLogin: this.state.wrongLogin + 1,
          wrongDivClassName: "wrong-login wrong-login-show",
        });
      }
    }
    this.usernameInput.current.focus();
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

          <div className={this.state.wrongDivClassName}>
            <span className="material-icons">error_outline</span>
            Wrong Username/Password
          </div>

          <div className="login-input-container">
            <input
              ref={this.usernameInput}
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

          <button type="button" className="forgot-password">
            Forgot Password?
          </button>
          <input type="submit" className="login-button" value="Login" />
        </form>
      </div>
    );
  }
}

export default Login;
