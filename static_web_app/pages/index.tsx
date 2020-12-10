import React from "react";
import Head from "next/head";
import Header from "../src/components/Header";
import Main from "../src/components/Main";

const index = () => {
  return (
    <div>
      <Head>
        <title>Jamiie</title>
      </Head>
      <Header />
      <Main />
    </div>
  );
};

export default index;
