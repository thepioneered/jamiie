import Router from "next/router";
import { postDataWithXcsrf } from "../services/apiServices";

async function checkToken() {
  try {
    const r = await postDataWithXcsrf("TOKEN_CHECK");
    console.log("Check R", r);
    if (Router.pathname === "/" || Router.pathname === "/login")
      Router.push("/admin/dashboard");
  } catch (e) {
    console.log("Check E", e);
    Router.push("/login");
  }
}

export default checkToken;
