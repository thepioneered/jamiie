import React from "react";
import "./Sidebar.css";
import logo from "../../images/NewLogo.svg";

export default function Sidebar({ isSidebarOpen, changePage, index }) {
  function sendList() {
    return index.map((item) => {
      let li_class = "not-active ";

      if (item.active) li_class = "active ";
      if (!isSidebarOpen) li_class += "li-close";

      return (
        <li
          key={item.name}
          className={li_class}
          onClick={() => changePage(item.name)}
        >
          <div
            className={
              isSidebarOpen ? "index-icon" : "index-icon index-icon-close"
            }
          >
            <span className="material-icons">{item.icon}</span>
          </div>
          {isSidebarOpen ? <div className="index-text">{item.name}</div> : null}
        </li>
      );
    });
  }

  return (
    <div className={isSidebarOpen ? "Sidebar" : "Sidebar Sidebar-close"}>
      <div className="logo-wrapper">
        <img
          src={logo}
          className={isSidebarOpen ? "logo" : "logo-close"}
          alt="logo"
        />
      </div>
      <ul className="index">{sendList()}</ul>
    </div>
  );
}
