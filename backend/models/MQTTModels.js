const mongoose = require('mongoose');

// Définition du schéma pour un message MQTT
const mqttMessageSchema = new mongoose.Schema({
    topic: {
        type: String,
        required: true,
    },
    message: {
        type: String,
        required: true,
    },
    timestamp: {
        type: Date,
        default: Date.now,
    },
});

// Création du modèle pour les messages MQTT
const MQTTMessage = mongoose.model('MQTTMessage', mqttMessageSchema);

module.exports = MQTTMessage;