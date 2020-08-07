import React from "react";
import { Link } from "react-router-dom";
import logo from "../../images/NewLogo.svg";
import "./NotFound.css";

export default function NotFound() {
  return (
    <div className="not-found">
      <div>
        <img src={logo} alt="Logo" />
      </div>
      <h1>404 Not Found</h1>
      <p>
        Go to <Link to={"/login"}>Login</Link>
      </p>
    </div>
  );
}
