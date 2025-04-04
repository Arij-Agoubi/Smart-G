const mongoose = require('mongoose');

// Définition du schéma pour une alerte
const notifSchema = new mongoose.Schema({
    message: {
        type: String,
        required: true,
    },
    createdAt: {
        type: Date,
        default: Date.now,
    },
    severity: {
        type: String,
        enum: ['info', 'warning', 'error'], // Types d'alerte
        required: true,
    },
});

// Création du modèle Alerte
const Notif = mongoose.model('Notif', notifSchema);

module.exports = Notif;