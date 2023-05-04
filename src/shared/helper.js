import axios from "axios";
import { createContext } from "react";

export const Context = createContext();

export const getRequest = (relative_url = "/", options = null) => {
  const BACKEND_BASE_URL = process.env.REACT_APP_BACKEND_BASE_URL;
  return axios.get(BACKEND_BASE_URL + relative_url);
};

export const postRequest = async (
  relative_url = "/",
  post_data = {},
  options = null
) => {
  const BACKEND_BASE_URL = process.env.REACT_APP_BACKEND_BASE_URL;
  return axios.post(BACKEND_BASE_URL + relative_url, post_data);
};
