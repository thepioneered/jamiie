import React, { useContext, useEffect } from "react";
import { LoaderContext } from "./_app";
import { useRouter } from "next/router";
import Loading from "../src/components/Loading";
import { globalContext } from "../src/interfaces/global";

function App() {
  const { state } = useContext<globalContext>(LoaderContext);
  const router = useRouter();

  useEffect(() => {
    if (state.tokenValidated) router.push("/admin/dashboard");
    else router.push("/login");
  }, []);

  return <Loading />;
}

export default App;
