import React, { Component } from "react";
import auth from "../../utils/auth";
import logo from "../../images/NewLogo.svg";
import "./Login.css";
import { Redirect } from "react-router-dom";

class Login extends Component {
  constructor() {
    super();

    this.usernameInput = React.createRef();
    this.state = {
      username: "",
      password: "",
      // check the wrong count
      wrongLogin: 0,
      // change classname for animation
      wrongDivClassName: "wrong-login",
    };
  }

  componentDidMount = async () => {
    const result = await auth.setup();
    console.log(result);
    // if (result) this.props.history.push("/dashboard");
  };

  handleChange = (event) => {
    const { name, value } = event.target;
    this.setState({
      [name]: value,
    });
  };

  handleSubmit = async (event) => {
    event.preventDefault();
    const isCorrect = await auth.login(
      this.state.username,
      this.state.password
    );
    console.log(auth.isLoggedIn());

    if (!isCorrect) {
      //
      // If more than one wrong login animate the wrong dialog box
      if (this.state.wrongLogin > 0) {
        this.setState({
          wrongLogin: this.state.wrongLogin + 1,
          wrongDivClassName: "wrong-login wrong-login-show double-wrong",
        });

        // Disable the animation class after 600ms
        setTimeout(
          () =>
            this.setState({
              wrongDivClassName: "wrong-login wrong-login-show",
            }),
          600
        );
      }

      // Else just show the dialog box(no animation)
      else {
        this.setState({
          wrongLogin: this.state.wrongLogin + 1,
          wrongDivClassName: "wrong-login wrong-login-show",
        });
      }

      // Focus on username
      this.usernameInput.current.focus();
    }
    // Upon Successfull redirect to dashboard
    else this.props.history.push("/dashboard");
  };

  render() {
    if (!auth.isLoggedIn()) {
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
    } else {
      return (
        <Redirect
          to={{
            pathname: "/dashboard",
            state: {
              from: this.props.location,
            },
          }}
        />
      );
    }
  }
}

export default Login;
