<p align="center">
  <a href="" rel="noopener">
 <img width=400px height=200px src="https://124135-361502-raikfcquaxqncofqfm.stackpathdns.com/asset/img/banners/blog/rest_api.png" alt="logo"></a>
</p>

<h3 align="center">Backend Tickitz - Arkademy</h3>

---

## 🧐 About
This is the repository Backend of the Bootcamp Arkademy task

#### User Endpoint
| METHOD | API | REMARKS |
| :-------------: |:-------------:|:-----------:|
| ```POST``` | /v1/users | Input Data To Table Users |
| ```GET``` | /v1/users/:userId | Get Data By userID |
| ```GET``` | /v1/users | Get All Data User |
| ```GET``` | /v1/users?page=xx&limit=xx | Get Data With Pagination |
| ```PUT``` | /v1/users/:userId | Edit Data By userID |
| ```DELETE``` | /v1/users/:userId | Delete Data By userID |


#### Ticket Endpoint
| METHOD | API | REMARKS |
| :-------------: |:-------------:|:-----------:|
| ```POST``` | /v1/tickets | Input Data To Table Ticket |
| ```GET``` | /v1/tickets/details/movie/:userId&?movie=:movieId | Get Ticket By userID & movieID|
| ```GET``` | /v1/tickets/details/user/:userId | Get All Ticket By userID |
| ```GET``` | /v1/tickets/details/user/:userId?page=xx&limit=xx | Get Ticket By userID With Pagination |
| ```GET``` | /v1/tickets/:userId?name=:movieName| Get Ticket By userID With Spesific Movie Name |
| ```GET``` | /v1/tickets?ticketId:ticketId | Get Ticket By ticketId|
| ```PUT``` | /v1/tickets/:userId?ticketId=:ticketId | Edit Ticket By userID & ticketID |
| ```DELETE``` | /v1/tickets/:userId?ticketId=:ticketId | Delete Ticket By userID & ticketID |


## 💻 Installation

Follow the steps below

1. Clone this repo
```
git clone https://github.com/therevolt/BE-Ticktiz
cd BE-Ticktiz
```

2. Install module & Import Database
##### Install Module
```
npm install
```

##### Import Database
Import ``` tickitz.sql ``` To Your Databases
<br> You Can Follow [This Steps](https://www.a2hosting.com/kb/developer-corner/mysql/import-and-export-a-mysql-database)

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
| EXAMPLE URL | [http://localhost:6000]() |
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

## 🔖 Standard Response & Preview Request By Postman
#### Standard Response API
```json
{
    "status": true,
    "message": "success register",
    "data": [object Object]
}
```
Object data contains content according to the request

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
|Database|✅|DONE|
|CRUD|✅|DONE|
|Pencarian Tiket Film|✅|DONE|
|Pengurutan Transaksi dan Tiket Film Berdasarkan Yang Terbaru|✅|DONE|
|Pagination|✅| User, Ticket, Movie |
|GitHub|✅|[Here](https://github.com/therevolt/BE-Ticktiz)|
|Linter|✅|DONE|
|Flowchart dari 1 Endpoint|✅|[Here](https://drive.google.com/drive/folders/1E4yWNIxbCZDeedrTu19iAa30sN_PQqkz?usp=sharing)
|Error Handling|✅|DONE|
|(Opsional) Dokumentasi Postman|✅|[Here](https://documenter.getpostman.com/view/10780576/Tz5jeLFz#780297f5-2766-41f8-adce-21ec23b0e0b7)
|Cors|✅|DONE|
|Env|✅|DONE|


## ✍️ Authors

- [@therevolt](https://github.com/therevolt)
