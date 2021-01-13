import React from "react";
import Head from "next/head";
import Header from "../src/components/Header";
import Meet from "../src/components/Meet";

const meet = () => {
  return (
    <>
      <Head>
        <title>Jamiie</title>
      </Head>
      <Header />
      <Meet />
    </>
  );
};

export default meet;
