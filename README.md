<p align="center">
  <a href="" rel="noopener">
 <img width=400px height=200px src="https://124135-361502-raikfcquaxqncofqfm.stackpathdns.com/asset/img/banners/blog/rest_api.png" alt="logo"></a>
</p>

<h3 align="center">Backend Tickitz - Arkademy</h3>

---

## 🧐 About
This is the repository Backend of the Bootcamp Arkademy task


## 💻 Installation

Follow the steps below

1. Clone this repo
```
git clone https://github.com/therevolt/BE-Ticktiz
cd BE-Ticktiz
```

2. Install module
```
npm install
```

3. Create env file
```
# ---------------------------------------
#               CONFIG DB
# ---------------------------------------
DB_HOST= #host database
DB_USER= #user database
DB_PASS= #pass database
DB_NAME= #database name

# ---------------------------------------
#            CONFIG GENERAL
# ---------------------------------------
PORT= #port app
HOST= #host/domain app
```
Detail CONFIG GENERAL
| URL | [http://localhost:6000]() |
| :-------------: |:-------------:|
| PORT | 6000 |
| HOST | [http://localhost]() |

4. Done, You can run it in the way below
##### Developer Mode (with nodemon)
```
npm run dev
```
##### Production Mode (only node)
```
npm start
```

## Sample Response & Preview Request By Postman
#### Sample Response
```json
{
    "status": true,
    "message": "success register",
    "data": {
        "first_name": "Herza",
        "last_name": "P",
        "email": "sample@gmail.com",
        "password": "ArkademY2021"
    }
}
```

#### Preview Request By Postman
![Preview](https://i.ibb.co/McdR01S/sample.png)

## ⛏️ Built Using

- [ExpressJS](https://expressjs.com)
- [MySQL2 Package](https://www.npmjs.com/package/mysql2)
- [CORS Package](https://www.npmjs.com/package/cors)
- [Body Parser Package](https://www.npmjs.com/package/body-parser)
- [Morgan Package](https://www.npmjs.com/package/morgan)
- [DotEnv Package](https://www.npmjs.com/package/dotenv)
- [Nodemon Package](https://www.npmjs.com/package/nodemon)


## 💭 Documentation

[Click Here](https://documenter.getpostman.com/view/10780576/Tz5jeLFz#de35d897-0209-4a28-b9d3-cd2225756a85)


## 🎯 Target Assignment
|Assignment | Status | Info |
|:---------|:-------:|:----:|
|Database|✅||
|CRUD|✅||
|Pencarian Tiket Film|✅||
|Pengurutan Transaksi dan Tiket Film Berdasarkan Yang Terbaru|✅||
|Pagination|✅||
|GitHub|✅|[Here](https://github.com/therevolt/BE-Ticktiz)|
|Linter|✅||
|Flowchart dari 1 Endpoint|✅|[Here](https://drive.google.com/drive/folders/1E4yWNIxbCZDeedrTu19iAa30sN_PQqkz?usp=sharing)
|Error Handling|✅||
|(Opsional) Dokumentasi Postman|✅|[Here](https://documenter.getpostman.com/view/10780576/Tz5jeLFz#780297f5-2766-41f8-adce-21ec23b0e0b7)
|Cors|✅|
|Env|✅|


## ✍️ Authors

- [@therevolt](https://github.com/therevolt)
