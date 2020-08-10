function postOperation(
  handler,
  apiPath,
  dataContent,
  apiRoute,
  domain = API_ENDPOINT
) {
  return new Promise((resolve, reject) => {
    handler
      .post(domain + apiPath, dataContent)
      .then((res) => {
        const data =
          typeof res.data.data !== "undefined" ? res.data.data : res.data;
        resolve(data);
      })
      .catch((error) => {
        logout(error.response.status);
        reject(error.response);
      });
  });
}

export const postDataWithXcsrf = (apiRoute, dataContent) =>
  postOperation(httpXcsrfHandler(), apiCalls[apiRoute], dataContent, apiRoute);
