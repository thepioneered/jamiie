import React, { useState } from "react";
import { Header, Sidebar, Main, Login } from "./components";

// TODO changePage ?
export default function App() {
  const [isLoggedIn, setLoggedIn] = useState(false);
  const [isSidebarOpen, setSidebar] = useState(true);
  const [index, setIndex] = useState([
    { name: "Dashboard", icon: "dashboard", active: true },
    { name: "Transactions", icon: "timeline", active: false },
    { name: "Groups", icon: "group", active: false },
    { name: "Users", icon: "person_outline", active: false },
  ]);

  const toggleSidebar = () => {
    setSidebar((prevState) => !prevState);
  };

  const changePage = (pageName) => {
    setIndex((prevState) =>
      prevState.map((item) => {
        if (item.active) item.active = !item.active;
        if (item.name === pageName) item.active = !item.active;
        return item;
      })
    );
  };

  const activeIndex = index.filter((item) => item.active);

  if (isLoggedIn) {
    return (
      <div className="App">
        <Sidebar
          isSidebarOpen={isSidebarOpen}
          index={index}
          changePage={changePage}
        />
        <Header toggleSidebar={toggleSidebar} />
        <Main activeIndex={activeIndex[0]} isSidebarOpen={isSidebarOpen} />
      </div>
    );
  } else {
    return (
      <div className="app-login">
        <Login />
      </div>
    );
  }
}
