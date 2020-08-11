import crypto from "crypto";

function hashit(pwd) {
  return new Promise((resolve, reject) => {
    const hash = crypto.createHash("sha256").update(pwd).digest("hex");
    resolve(hash);
  });
}

export default hashit;
