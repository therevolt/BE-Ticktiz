const nodemailer = require("nodemailer");

let transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: "ramaseftiansyah14@gmail.com", // generated ethereal user
    pass: "ramatamvan12", // generated ethereal password
  },
});

const sendMail = (mailTo, body) => {
  return new Promise(async (resolve, reject) => {
    // send mail with defined transport object
    try {
      let info = await transporter.sendMail({
        from: "ramaseftiansyah14@gmail.com", // sender address
        to: mailTo, // list of receivers
        subject: "Tickitz Website", // Subject line
        text: "Tickitz Website", // plain text body
        html: `<b>${body}</b>`, // html body
      });

      console.log("Message sent: %s", info.messageId);
      resolve("Success! Please Check Your Email!");
    } catch {
      reject("Failed!");
    }
  });
};

module.exports = sendMail;
