const express = require('express')
const Route = express.Router()

const ticketControllers = require('../controllers/tickets')
const movieControllers = require('../controllers/movies')
const userControllers = require('../controllers/users')

Route.post('/users', userControllers.inputUser)
  .get('/users/:userId', userControllers.getUserByUserId)
  .put('/users/:userId', userControllers.editUserByUserId)
  .delete('/users/:userId')

Route.post('/tickets', ticketControllers.inputTicket)
  .get('/tickets/:userId', ticketControllers.getTicketByFilmName)
  .get('/tickets/details/user/:userId', ticketControllers.getDetailTicketByUserId)
  .get('/tickets/details/trx/:trxId', ticketControllers.getDetailTicketByTrxId)
  .get('/tickets/details/movie/:userId', ticketControllers.getTicketByMovieId)
  .put('/tickets/:userId', ticketControllers.updateTicketByUserId)
  .delete('/tickets/:userId', ticketControllers.deleteTicketByUserId)

Route.post('/movies', movieControllers.inputMovie)
  .get('/movies', movieControllers.getAllMovies)
  .get('/movies/:movieId', movieControllers.getMovieDetails)
  .put('/movies/:movieId', movieControllers.editMovieDetails)
  .delete('/movies/:movieId', movieControllers.delMovie)

module.exports = Route
