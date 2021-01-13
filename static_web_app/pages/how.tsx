import React from "react";
import Head from "next/head";
import Header from "../src/components/Header";
import How from "../src/components/How";

const how = () => {
  return (
    <>
      <Head>
        <title>Jamiie</title>
      </Head>
      <Header />
      <How />
    </>
  );
};

export default how;
