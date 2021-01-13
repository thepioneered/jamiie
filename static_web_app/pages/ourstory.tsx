import React from "react";
import Head from "next/head";
import Header from "../src/components/Header";
import OurStory from "../src/components/OurStory";

const ourstory = () => {
  return (
    <>
      <Head>
        <title>Jamiie</title>
      </Head>
      <Header />
      <OurStory />
    </>
  );
};

export default ourstory;
