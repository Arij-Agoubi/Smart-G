const mongoose = require('mongoose');

// Définition du schéma utilisateur
const userSchema = new mongoose.Schema({
    username: {
        type: String,
        required: true,
        unique: true,
    },
    email: {
        type: String,
        required: true,
        unique: true,
        lowercase: true, // Convertit l'email en minuscules
        trim: true, // Supprime les espaces autour de l'email
    },
    password: {
        type: String,
        required: true,
    },
}, { timestamps: true }); // Ajoute des timestamps pour createdAt et updatedAt

// Création du modèle utilisateur
const User = mongoose.model('User ', userSchema);

module.exports = User;