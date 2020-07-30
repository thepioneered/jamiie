import axios from "axios";
import auth from "../../utils/auth";

class call {
  async callServer(url) {
    try {
      const accessToken = auth.getAccessToken();
      const result = await axios(`http://localhost:4000/${url}`, {
        method: "post",
        headers: {
          Authorization: `Bearer ${accessToken}`,
        },
      });

      console.log(result);
      return result.data;
    } catch (err) {
      const checkRefershToken = await auth.setup();
      if (checkRefershToken) {
        return this.callServer(url);
      }
      return false;
    }
  }
}

export default new call();
