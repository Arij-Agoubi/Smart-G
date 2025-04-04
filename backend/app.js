// Importer les modules nécessaires
const express = require('express');
const connectDB = require('./dbConfig/config');

const actionneurRoute = require('./routes/actionneurRoute'); 
const controlActionneurRoutes = require('./routes/controlactionneurRoute'); 
const notifRoutes = require('./routes/notifRoute');
const authRoute = require('./routes/authRoute');
const cors = require('cors');

const app = express();

// Middleware pour activer CORS
app.use(cors());

// Ou, pour plus de contrôle :
app.use(cors({
  origin: '*', // Autorise seulement cette origine
  methods: '*', // Méthodes autorisées
  allowedHeaders: 'Content-Type,Authorization' // Headers autorisés
}));

connectDB();

// Middleware pour parser les données JSON dans les requêtes
app.use(express.json());

app.use('/api/actionneurs', actionneurRoute); // Routes des actionneurs
app.use('/api/actionneurControl', controlActionneurRoutes);
app.use('/api/notifs', notifRoutes);
app.use('/api/auth', authRoute);

// Route de base pour tester le serveur
app.get('/', (req, res) => {
  res.send('Backend de la serre agricole connectée');
});

// Route pour /agricole
app.get('/agricole', (req, res) => {
  res.send('Welcome to Api Agricole');
});

// Démarrer le serveur sur le port 3000
const port = 3000;
app.listen(port, () => {
  console.log(`Serveur backend en écoute sur http://localhost:${port}`);
});
