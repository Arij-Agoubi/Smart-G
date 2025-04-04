const mongoose = require('mongoose');

// Définition du schéma pour un actionneur
const actionneurSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
        unique: true, // Assurez-vous que chaque actionneur a un nom unique
    },
    type: {
        type: String,
        required: true, // Type de l'actionneur (ex: "ventilateur", "pompe", etc.)
    },
    status: {
        type: String,
        enum: ['activé', 'désactivé'], // Limite les valeurs possibles pour le statut
        default: 'désactivé', // Valeur par défaut
    },
    serreId: { // Changement de location à serreId
        type: String,
    },
}, { timestamps: true }); // Ajoute des timestamps pour createdAt et updatedAt

// Création du modèle Actionneur
const Actionneur = mongoose.model('Actionneur', actionneurSchema);

module.exports = Actionneur;