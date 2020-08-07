import React, { useState } from "react";
import logo from "../../images/NewLogo.svg";
import "./Login.css";

export default function Login() {
  const usernameInput = React.createRef();

  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [wrongLogin, setWrongLogin] = useState(0);
  const [wrongDivClassName, setWrongDivClassName] = useState("wrong-login");

  const handleSubmit = (event) => {
    event.preventDefault();
    console.log(`username:${username}\npassword:${password}`);

    const w = true;

    if (w) {
      if (wrongLogin > 0) {
        setWrongLogin((prevState) => prevState + 1);
        setWrongDivClassName("wrong-login wrong-login-show double-wrong");
        setTimeout(
          () => setWrongDivClassName("wrong-login wrong-login-show"),
          600
        );
      } else {
        setWrongDivClassName("wrong-login wrong-login-show");
        setWrongLogin((prevState) => prevState + 1);
      }

      // Focus on username
      usernameInput.current.focus();
    }
    usernameInput.current.focus();
  };

  return (
    <div className="Login">
      <div className="login-logo">
        <img src={logo} alt="Logo" />
      </div>

      <form className="login-card" onSubmit={(event) => handleSubmit(event)}>
        <div className="login-title">
          <div className="login-title-heading">Admin</div>
          <div className="login-title-description">
            Login To Access Your Dashboard
          </div>
        </div>

        <div className={wrongDivClassName}>
          <span className="material-icons">error_outline</span>
          Wrong Username/Password
        </div>

        <div className="login-input-container">
          <input
            ref={usernameInput}
            type="text"
            name="username"
            className="login-input"
            required={true}
            onChange={(e) => setUsername(e.target.value)}
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
            onChange={(e) => setPassword(e.target.value)}
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
