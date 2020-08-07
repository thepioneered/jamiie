import React from "react";
import "./Dashboard.css";

export default function Dashboard({ isSidebarOpen }) {
  const getCards = (name, number, percentage) => {
    const addCommasToNumber = number
      .toString()
      .replace(/\B(?=(\d{3})+(?!\d))/g, ",");

    let color = "#39dc00";
    let status = "Up";
    let icon = "trending_up";

    if (percentage === 0) {
      color = "#a3a3a3";
      status = "Change";
      icon = "linear_scale";
    } else if (percentage < 0) {
      color = "#ea3a3a";
      status = "Down";
      icon = "trending_down";
    }

    return (
      <div className="card">
        <div className="card-heading">{name}</div>
        <div className="card-number">{addCommasToNumber}</div>
        <div className="card-description">
          <span className="material-icons card-icon" style={{ color: color }}>
            {icon}
          </span>
          <span className="card-percentage" style={{ color: color }}>
            &nbsp;{Math.abs(percentage)}%
          </span>
          <span className="card-status">&nbsp;{status} from Yesterday</span>
        </div>
      </div>
    );
  };

  const maxWidth = isSidebarOpen ? "280px" : "110px";

  return (
    <div className="dashboard">
      <div
        className="card-flex-wrapper"
        style={{ maxWidth: `calc(100vw - ${maxWidth})` }}
      >
        <div className="card-container">
          {getCards("Total Transactions", 46289, 2.4)}
          {getCards("Total Users", 22544, 0.4)}
          {getCards("Total Groups", 11289, -1.4)}
          {getCards("Completed Pools", 33289, 0)}
        </div>
      </div>

      <a href="#about">Go to About</a>

      <div>
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Facilis
        dignissimos pariatur veniam modi vero reprehenderit voluptatum
        laudantium aperiam, illo voluptas eius perferendis expedita doloribus
        suscipit architecto obcaecati accusantium cum dolor libero facere
        placeat dolorem. Voluptates sapiente aliquid voluptatibus ipsa
        temporibus a beatae consectetur cupiditate, corporis quis, deleniti
        perferendis, minima laudantium veniam ut rem tempore ullam blanditiis?
        Dicta fuga sunt ab ratione voluptas possimus recusandae dolorum impedit
        quaerat nulla esse minima quam exercitationem voluptatum, sapiente
        quibusdam aut quod! Fuga deleniti quia, esse odit, maiores nobis
        blanditiis provident eaque necessitatibus laboriosam quibusdam
        praesentium dolorum ab tempore? Aperiam saepe ut quo nostrum molestias?
      </div>
      <div>
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Facilis
        dignissimos pariatur veniam modi vero reprehenderit voluptatum
        laudantium aperiam, illo voluptas eius perferendis expedita doloribus
        suscipit architecto obcaecati accusantium cum dolor libero facere
        placeat dolorem. Voluptates sapiente aliquid voluptatibus ipsa
        temporibus a beatae consectetur cupiditate, corporis quis, deleniti
        perferendis, minima laudantium veniam ut rem tempore ullam blanditiis?
        Dicta fuga sunt ab ratione voluptas possimus recusandae dolorum impedit
        quaerat nulla esse minima quam exercitationem voluptatum, sapiente
        quibusdam aut quod! Fuga deleniti quia, esse odit, maiores nobis
        blanditiis provident eaque necessitatibus laboriosam quibusdam
        praesentium dolorum ab tempore? Aperiam saepe ut quo nostrum molestias?
      </div>
      <div>
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Facilis
        dignissimos pariatur veniam modi vero reprehenderit voluptatum
        laudantium aperiam, illo voluptas eius perferendis expedita doloribus
        suscipit architecto obcaecati accusantium cum dolor libero facere
        placeat dolorem. Voluptates sapiente aliquid voluptatibus ipsa
        temporibus a beatae consectetur cupiditate, corporis quis, deleniti
        perferendis, minima laudantium veniam ut rem tempore ullam blanditiis?
        Dicta fuga sunt ab ratione voluptas possimus recusandae dolorum impedit
        quaerat nulla esse minima quam exercitationem voluptatum, sapiente
        quibusdam aut quod! Fuga deleniti quia, esse odit, maiores nobis
        blanditiis provident eaque necessitatibus laboriosam quibusdam
        praesentium dolorum ab tempore? Aperiam saepe ut quo nostrum molestias?
      </div>
      <div>
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Facilis
        dignissimos pariatur veniam modi vero reprehenderit voluptatum
        laudantium aperiam, illo voluptas eius perferendis expedita doloribus
        suscipit architecto obcaecati accusantium cum dolor libero facere
        placeat dolorem. Voluptates sapiente aliquid voluptatibus ipsa
        temporibus a beatae consectetur cupiditate, corporis quis, deleniti
        perferendis, minima laudantium veniam ut rem tempore ullam blanditiis?
        Dicta fuga sunt ab ratione voluptas possimus recusandae dolorum impedit
        quaerat nulla esse minima quam exercitationem voluptatum, sapiente
        quibusdam aut quod! Fuga deleniti quia, esse odit, maiores nobis
        blanditiis provident eaque necessitatibus laboriosam quibusdam
        praesentium dolorum ab tempore? Aperiam saepe ut quo nostrum molestias?
      </div>
      <div>
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Facilis
        dignissimos pariatur veniam modi vero reprehenderit voluptatum
        laudantium aperiam, illo voluptas eius perferendis expedita doloribus
        suscipit architecto obcaecati accusantium cum dolor libero facere
        placeat dolorem. Voluptates sapiente aliquid voluptatibus ipsa
        temporibus a beatae consectetur cupiditate, corporis quis, deleniti
        perferendis, minima laudantium veniam ut rem tempore ullam blanditiis?
        Dicta fuga sunt ab ratione voluptas possimus recusandae dolorum impedit
        quaerat nulla esse minima quam exercitationem voluptatum, sapiente
        quibusdam aut quod! Fuga deleniti quia, esse odit, maiores nobis
        blanditiis provident eaque necessitatibus laboriosam quibusdam
        praesentium dolorum ab tempore? Aperiam saepe ut quo nostrum molestias?
      </div>
      <div>
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Facilis
        dignissimos pariatur veniam modi vero reprehenderit voluptatum
        laudantium aperiam, illo voluptas eius perferendis expedita doloribus
        suscipit architecto obcaecati accusantium cum dolor libero facere
        placeat dolorem. Voluptates sapiente aliquid voluptatibus ipsa
        temporibus a beatae consectetur cupiditate, corporis quis, deleniti
        perferendis, minima laudantium veniam ut rem tempore ullam blanditiis?
        Dicta fuga sunt ab ratione voluptas possimus recusandae dolorum impedit
        quaerat nulla esse minima quam exercitationem voluptatum, sapiente
        quibusdam aut quod! Fuga deleniti quia, esse odit, maiores nobis
        blanditiis provident eaque necessitatibus laboriosam quibusdam
        praesentium dolorum ab tempore? Aperiam saepe ut quo nostrum molestias?
      </div>
      <div>
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Facilis
        dignissimos pariatur veniam modi vero reprehenderit voluptatum
        laudantium aperiam, illo voluptas eius perferendis expedita doloribus
        suscipit architecto obcaecati accusantium cum dolor libero facere
        placeat dolorem. Voluptates sapiente aliquid voluptatibus ipsa
        temporibus a beatae consectetur cupiditate, corporis quis, deleniti
        perferendis, minima laudantium veniam ut rem tempore ullam blanditiis?
        Dicta fuga sunt ab ratione voluptas possimus recusandae dolorum impedit
        quaerat nulla esse minima quam exercitationem voluptatum, sapiente
        quibusdam aut quod! Fuga deleniti quia, esse odit, maiores nobis
        blanditiis provident eaque necessitatibus laboriosam quibusdam
        praesentium dolorum ab tempore? Aperiam saepe ut quo nostrum molestias?
      </div>
      <div>
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Facilis
        dignissimos pariatur veniam modi vero reprehenderit voluptatum
        laudantium aperiam, illo voluptas eius perferendis expedita doloribus
        suscipit architecto obcaecati accusantium cum dolor libero facere
        placeat dolorem. Voluptates sapiente aliquid voluptatibus ipsa
        temporibus a beatae consectetur cupiditate, corporis quis, deleniti
        perferendis, minima laudantium veniam ut rem tempore ullam blanditiis?
        Dicta fuga sunt ab ratione voluptas possimus recusandae dolorum impedit
        quaerat nulla esse minima quam exercitationem voluptatum, sapiente
        quibusdam aut quod! Fuga deleniti quia, esse odit, maiores nobis
        blanditiis provident eaque necessitatibus laboriosam quibusdam
        praesentium dolorum ab tempore? Aperiam saepe ut quo nostrum molestias?
      </div>
      <div>
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Facilis
        dignissimos pariatur veniam modi vero reprehenderit voluptatum
        laudantium aperiam, illo voluptas eius perferendis expedita doloribus
        suscipit architecto obcaecati accusantium cum dolor libero facere
        placeat dolorem. Voluptates sapiente aliquid voluptatibus ipsa
        temporibus a beatae consectetur cupiditate, corporis quis, deleniti
        perferendis, minima laudantium veniam ut rem tempore ullam blanditiis?
        Dicta fuga sunt ab ratione voluptas possimus recusandae dolorum impedit
        quaerat nulla esse minima quam exercitationem voluptatum, sapiente
        quibusdam aut quod! Fuga deleniti quia, esse odit, maiores nobis
        blanditiis provident eaque necessitatibus laboriosam quibusdam
        praesentium dolorum ab tempore? Aperiam saepe ut quo nostrum molestias?
      </div>
      <div>
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Facilis
        dignissimos pariatur veniam modi vero reprehenderit voluptatum
        laudantium aperiam, illo voluptas eius perferendis expedita doloribus
        suscipit architecto obcaecati accusantium cum dolor libero facere
        placeat dolorem. Voluptates sapiente aliquid voluptatibus ipsa
        temporibus a beatae consectetur cupiditate, corporis quis, deleniti
        perferendis, minima laudantium veniam ut rem tempore ullam blanditiis?
        Dicta fuga sunt ab ratione voluptas possimus recusandae dolorum impedit
        quaerat nulla esse minima quam exercitationem voluptatum, sapiente
        quibusdam aut quod! Fuga deleniti quia, esse odit, maiores nobis
        blanditiis provident eaque necessitatibus laboriosam quibusdam
        praesentium dolorum ab tempore? Aperiam saepe ut quo nostrum molestias?
      </div>
      <div id="about">
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Facilis
        dignissimos pariatur veniam modi vero reprehenderit voluptatum
        laudantium aperiam, illo voluptas eius perferendis expedita doloribus
        suscipit architecto obcaecati accusantium cum dolor libero facere
        placeat dolorem. Voluptates sapiente aliquid voluptatibus ipsa
        temporibus a beatae consectetur cupiditate, corporis quis, deleniti
        perferendis, minima laudantium veniam ut rem tempore ullam blanditiis?
        Dicta fuga sunt ab ratione voluptas possimus recusandae dolorum impedit
        quaerat nulla esse minima quam exercitationem voluptatum, sapiente
        quibusdam aut quod! Fuga deleniti quia, esse odit, maiores nobis
        blanditiis provident eaque necessitatibus laboriosam quibusdam
        praesentium dolorum ab tempore? Aperiam saepe ut quo nostrum molestias?
      </div>
    </div>
  );
}
