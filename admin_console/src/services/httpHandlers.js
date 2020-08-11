import axios from "axios";

export function httpHandler() {
  const config = {
    withCredentials: false,
    timeout: 6000,
  };
  return axios.create(config);
}

export function httpXcsrfHandler() {
  const config = {
    withCredentials: true,
    timeout: 6000,
  };
  return axios.create(config);
}
