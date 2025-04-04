const express = require('express');
const {
    activateActionneur,
    deactivateActionneur,
} = require('../controllers/controlactionneurController');

const router = express.Router();

// Route pour activer un actionneur
router.post('/:id/activate', activateActionneur); // POST /api/actionneurs/:id/activate

// Route pour désactiver un actionneur
router.post('/:id/deactivate', deactivateActionneur); // POST /api/actionneurs/:id/deactivate

module.exports = router;