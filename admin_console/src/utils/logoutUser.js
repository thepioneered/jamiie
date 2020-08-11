import Router from "next/router";

const logoutUser = () => {
  if (Router.pathname !== "/login") Router.push("/login");
};

export default logoutUser;
