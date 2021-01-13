import React from "react";
import Head from "next/head";
import Header from "../src/components/Header";
import What from "../src/components/What";

const what = () => {
  return (
    <>
      <Head>
        <title>Jamiie</title>
      </Head>
      <Header />
      <What />
    </>
  );
};

export default what;
