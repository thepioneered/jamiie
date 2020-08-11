import React, { useState, useRef } from "react";
import Head from "next/head";
import cn from "classnames";
import { postData } from "../src/services/apiServices";
import Logo from "../public/images/svg/NewLogo.svg";
import styles from "../styles/login.module.scss";
import Router from "next/router";

export default function Login() {
  const usernameInput = useRef();

  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [wrongLogin, setWrongLogin] = useState(0);
  const [wrongDivClassName, setWrongDivClassName] = useState(styles.wrong);

  const handleSubmit = async (event) => {
    event.preventDefault();

    const payload = {
      phone: username,
      password: password,
    };

    try {
      await postData("LOGIN_ADMIN", payload);
      Router.push("/admin/dashboard");
    } catch (e) {
      if (wrongLogin > 0) {
        setWrongLogin((prevState) => prevState + 1);
        setWrongDivClassName(
          cn(styles.wrong, styles.wrongShow, styles.doubleWrong)
        );
        setTimeout(
          () => setWrongDivClassName(cn(styles.wrong, styles.wrongShow)),
          600
        );
      } else {
        setWrongDivClassName(cn(styles.wrong, styles.wrongShow));
        setWrongLogin((prevState) => prevState + 1);
      }
      usernameInput.current.focus();
    }
  };

  return (
    <div className={styles.Login}>
      <Head>
        <title>Login</title>
      </Head>
      <div style={{ marginTop: "1.5em" }}>
        <Logo />
      </div>

      <form className={styles.card} onSubmit={(event) => handleSubmit(event)}>
        <div>
          <div className={styles.heading}>Admin</div>
          <div className={styles.subheading}>
            Login To Access Your Dashboard
          </div>
        </div>

        <div className={wrongDivClassName}>
          <span className="material-icons">error_outline</span>
          Wrong Username/Password
        </div>

        <div className={styles.container}>
          <input
            ref={usernameInput}
            type="text"
            name="username"
            className={styles.input}
            required={true}
            value={username}
            onChange={(e) => setUsername(e.target.value)}
          />
          <label htmlFor="username" className={styles.label}>
            <span className={styles.username}>Username</span>
          </label>
        </div>

        <div className={styles.container}>
          <input
            type="password"
            name="password"
            className={styles.input}
            required={true}
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
          <label htmlFor="password" className={styles.label}>
            <span className={cn(styles.username)}>Password</span>
          </label>
        </div>

        <button type="button" className={styles.forgot}>
          Forgot Password?
        </button>
        <input type="submit" className={styles.button} value="Login" />
      </form>
    </div>
  );
}
