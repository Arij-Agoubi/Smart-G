const express = require('express');
const {
    sendMessage,
    getSubscribedTopics,
} = require('../controllers/MQTTController');

const router = express.Router();

// Route pour envoyer un message MQTT
router.post('/send', sendMessage); // POST /api/mqtt/send

// Route pour voir les topics souscrits
router.get('/subscribed', getSubscribedTopics); // GET /api/mqtt/subscribed

module.exports = router;