import React, { useState, useRef, useContext, useEffect } from "react";
import Head from "next/head";
import cn from "classnames";
import { LoaderContext } from "./_app";
import Logo from "../public/images/svg/NewLogo.svg";
import styles from "../styles/login.module.scss";
import { useRouter } from "next/router";
import { postData } from "../src/utils/apiCalls";
import { loginData } from "../src/interfaces/global";
import { endpoints } from "../src/constants/apiEndpoints";

export default function Login() {
  const usernameInput = useRef<HTMLInputElement>(null);
  const { state, dispatch } = useContext(LoaderContext);
  const router = useRouter();

  useEffect(() => {
    if (state.tokenValidated) router.push("/admin/dashboard");
  }, []);

  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [wrongLogin, setWrongLogin] = useState(0);
  const [loading, setLoading] = useState(false);
  const [wrongDivClassName, setWrongDivClassName] = useState(styles.wrong);

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    setLoading(true);

    const payload = {
      phone: username.trim(),
      password: password.trim(),
    };
    const r = await postData<loginData>({
      url: endpoints.LOGIN_ADMIN,
      payload,
    });

    if (r) {
      dispatch({ type: "setLoginData", data: r });
      dispatch({ type: "changeGlobal", item: "tokenValidated" });
      router.push("/admin/dashboard");
    } else {
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
      setLoading(false);
      usernameInput.current?.focus();
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

      <form className={cn(styles.card, "hover")} onSubmit={handleSubmit}>
        <div>
          <div className={styles.heading}>Admin</div>
          <div className={styles.subheading}>Login To Access our Dashboard</div>
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

        {loading ? (
          <div className={styles.spinner}></div>
        ) : (
          <button type="submit" className={styles.button}>
            Login
          </button>
        )}
      </form>
    </div>
  );
}
