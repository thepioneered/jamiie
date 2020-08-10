import React from "react";
import Head from "next/head";
import Login from "./login.jsx";

// TODO changePage ?
export default function App() {
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
