<p align="center">
  <a href="" rel="noopener">
 <img width=400px src="https://i.ibb.co/qdvgs8Y/Untitled-design-25.png" alt="logo"></a>
</p>


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

### Other endpoints are still in the documentation process


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
- [Morgan Package](https://www.npmjs.com/package/morgan)
- [DotEnv Package](https://www.npmjs.com/package/dotenv)
- [Redis Package](https://www.npmjs.com/package/redis)
- [JWT Package](https://www.npmjs.com/package/jsonwebtoken)
- [Nodemailer Package](https://www.npmjs.com/package/nodemailer)
- [UUID Package](https://www.npmjs.com/package/uuid)
- [Multer Package](https://www.npmjs.com/package/multer)
- [Bcrypt Package](https://www.npmjs.com/package/bcrypt)


## 💭 Documentation

[Click Here](https://documenter.getpostman.com/view/10780576/TzCHAV8d)

## 💻 FrontEnd

Repo Frontend : https://github.com/therevolt/ReactJS-FE-Tickitz

## 💻 Live Demo

[Netlify](https://tickitz.xyz/)

## ✍️ Authors

- [@therevolt](https://github.com/therevolt)
