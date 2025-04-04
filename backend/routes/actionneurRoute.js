const express = require('express');
const {
    addActionneur,
    getAllActionneurs,
    updateActionneur,
    deleteActionneur,
} = require('../controllers/actionneurController');

const router = express.Router();

// Route pour créer un nouvel actionneur
router.post('/', addActionneur); // POST /api/actionneurs

// Route pour récupérer tous les actionneurs
router.get('/:serreId', getAllActionneurs); // GET /api/actionneurs

// Route pour mettre à jour un actionneur
router.put('/:id', updateActionneur); // PUT /api/actionneurs/:id

// Route pour supprimer un actionneur
router.delete('/:id', deleteActionneur); // DELETE /api/actionneurs/:id

module.exports = router;