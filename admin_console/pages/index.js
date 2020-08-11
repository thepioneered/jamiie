import React from "react";
import Head from "next/head";
import { postDataWithXcsrf } from "../src/services/apiServices";
import Login from "./login.jsx";

// TODO changePage ?
export default function App() {
  const checkToken = async () => {
    try {
      const checkAuthRes = await postDataWithXcsrf("TOKEN_CHECK");
      console.log(checkAuthRes);
    } catch (e) {
      console.log("E:", e);
    }
  };

  checkToken();

  return (
    <div className="app-login">
      <Head>
        <title>Login</title>
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <Login />
    </div>
  );
}
