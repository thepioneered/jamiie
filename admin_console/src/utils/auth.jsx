import axios from "axios";

class Auth {
  constructor() {
    this.loggedIn = false;
    this.accessToken = "";
  }

  setup = async () => {
    try {
      const result = await axios("http://localhost:4000/request_refresh", {
        method: "post",
        withCredentials: true,
      });

      this.loggedIn = true;
      this.accessToken = result.data.accessToken;

      return true;
    } catch (err) {
      this.logout();
      return false;
    }
  };

  login = async (email, password) => {
    try {
      const result = await axios("http://localhost:4000/login", {
        method: "post",
        data: { email, password },
        withCredentials: true,
      });

      this.loggedIn = true;
      this.accessToken = result.data.accessToken;

      return true;
    } catch (err) {
      console.log(err);
      return false;
    }
  };

  logout = async () => {
    try {
      await axios("http://localhost:4000/logout", {
        method: "post",
        withCredentials: true,
      });

      this.loggedIn = false;
      this.accessToken = "";
      window.localStorage.setItem("logout", Date.now());

      return true;
    } catch (err) {
      console.log(err);
      return false;
    }
  };

  isLoggedIn = () => {
    return this.loggedIn;
  };

  getAccessToken = () => {
    return this.accessToken;
  };

  setAccessToken = (token) => {
    this.accessToken = token;
  };
}

export default new Auth();
