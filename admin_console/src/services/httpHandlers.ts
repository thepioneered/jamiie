import axios from "axios";

// TODO remove comment

export function httpHandler() {
  const config = {
    withCredentials: false,
    // credentials: "include",
    timeout: 10000,
  };
  return axios.create(config);
}

export function httpXcsrfHandler() {
  const config = {
    withCredentials: true,
    // credentials: "include",
    timeout: 10000,
  };
  return axios.create(config);
}
