import React from "react";
import Head from "next/head";
import Header from "../src/components/Header";
import Team from "../src/components/Team";

const ourstory = () => {
  return (
    <>
      <Head>
        <title>Jamiie</title>
      </Head>
      <Header />
      <Team />
    </>
  );
};

export default ourstory;
