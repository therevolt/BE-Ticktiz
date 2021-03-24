const nodemailer = require("nodemailer");
require("dotenv").config();

let transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: process.env.EMAIL, // generated ethereal user
    pass: process.env.PASSWORD, // generated ethereal password
  },
});

const sendMail = (mailTo, body) => {
  return new Promise(async (resolve, reject) => {
    // send mail with defined transport object
    try {
      let info = await transporter.sendMail({
        from: process.env.EMAIL, // sender address
        to: mailTo, // list of receivers
        subject: "Tickitz Website", // Subject line
        text: "Tickitz Website", // plain text body
        html: `<body style="margin: 0; padding: 0;">
        <table cellpadding="0" cellspacing="0" width="100%">
         <tr>
          <td>
           <table align="center" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;">
        <tr>
         <td>
          <table align="center" cellpadding="0" cellspacing="0" width="600">
        <tr>
         <td bgcolor="#70bbd9" style="padding: 20px 0 30px 0;" align="center">
        <img src="https://tickitz-web.netlify.app/assets/images/Tickitz%202.png" alt="Creating Email Magic" width="300" height="130" style="display: block;" />
         </td>
        </tr>
        <tr>
         <td bgcolor="#ffffff" style="padding: 40px 30px 40px 30px;">
        <table cellpadding="0" cellspacing="0" width="100%">
         <tr>
          <td>
           Hello Moviegoers!
          </td>
         </tr>
         <tr>
          <td style="padding: 20px 0 30px 0;">
           ${body.text}
          </td>
         </tr>
         <tr>
          <td>
           <a href="${body.url}">${body.textBtn}</a>
          </td>
         </tr>
        </table>
       </td>
        </tr>
        <tr>
         <td bgcolor="#ee4c50" align="center">
          URL Verify Will Expired 1 Hours After Recived!
         </td>
        </tr>
       </table>
         </td>
        </tr>
       </table>
          </td>
         </tr>
        </table>
       </body>`, // html body
      });

      console.log("Message sent: %s", info.messageId);
      resolve("Success! Please Check Your Email!");
    } catch (err) {
      reject("Failed!");
    }
  });
};

module.exports = sendMail;
