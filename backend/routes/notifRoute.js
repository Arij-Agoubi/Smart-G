const express = require('express');
const {
    getAllNotifs,
    addNotif,
    deleteNotif,
} = require('../controllers/notifController');

const router = express.Router();

// Route pour récupérer toutes les alertes
router.get('/', getAllNotifs); // GET /api/notifs

// Route pour ajouter une nouvelle alerte
router.post('/', addNotif); // POST /api/notifs

// Route pour supprimer une alerte
router.delete('/:id', deleteNotif); // DELETE /api/notifs/:id

module.exports = router;