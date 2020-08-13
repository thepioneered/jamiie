import React, { useEffect, useState } from "react";
import Loading from "../src/components/Loading";
import checkToken from "../src/utils/checkToken";
import Router from "next/router";

// TODO changePage ?
export default function App() {
  const [isLoading, setLoading] = useState(true);

  useEffect(() => {
    checkToken();
  }, []);

  if (isLoading) return <Loading />;
  else Router.push("/login");
}
