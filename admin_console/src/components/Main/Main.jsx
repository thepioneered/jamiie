import React from "react";
import { Dashboard } from "../index";
import "./Main.css";

export default function Main({ isSidebarOpen }) {
  return (
    <div className="Main">
      <Dashboard isSidebarOpen={isSidebarOpen} />
    </div>
  );
}
