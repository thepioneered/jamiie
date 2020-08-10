import React from "react";
import { sidebarContext } from "../utils/sidebarContext";
import "../styles/globals.scss";

function MyApp({ Component, pageProps }) {
  return <Component {...pageProps} />;
}

export default MyApp;
