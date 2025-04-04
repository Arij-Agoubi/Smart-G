const express = require('express');
const { 
    register, 
    getUsers,
    login,          // Importer la fonction de connexion
    getMe,          // Importer la fonction pour obtenir les infos de l'utilisateur connecté
    logout          // Importer la fonction de déconnexion
} = require('../controllers/authController');

const router = express.Router();

// Route pour l'enregistrement d'un nouvel utilisateur
router.post('/register', register);

// Route pour récupérer tous les utilisateurs
router.get('/users', getUsers);

// Route pour la connexion d'un utilisateur
router.post('/login', login); // POST /api/auth/login

// Route pour obtenir les informations de l'utilisateur connecté
router.get('/me', getMe); // GET /api/auth/me

// Route pour la déconnexion d'un utilisateur
router.post('/logout', logout); // POST /api/auth/logout

module.exports = router;