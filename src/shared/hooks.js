import { useState, useEffect } from "react";
import axios from "axios";

export const useGet = (relative_url = "/", options = null) => {
  const BACKEND_BASE_URL = process.env.REACT_APP_BACKEND_BASE_URL;
  const [data, setData] = useState(null);

  useEffect(() => {
    const tempFunction = async () => {
      const response = await axios.get(BACKEND_BASE_URL + relative_url);
      setData(response);
    };

    tempFunction();
  }, [relative_url, options]);

  return { data };
};

export const usePost = (relative_url = "/", post_data = {}, options = null) => {
  const BACKEND_BASE_URL = process.env.BACKEND_BASE_URL;
  const [data, setData] = useState(null);

  useEffect(() => {
    const tempFunction = async () => {
      const response = await axios.post(
        BACKEND_BASE_URL + relative_url,
        post_data
      );
      setData(response);
    };

    tempFunction();
  }, []);

  return { data };
};
