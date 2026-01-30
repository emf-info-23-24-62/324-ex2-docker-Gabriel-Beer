# Utiliser l'image officielle Node.js LTS
FROM node:20-alpine

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers package
COPY app/package*.json ./

# Installer les dépendances
RUN npm install --production

# Copier le code de l'application
COPY app/ .

# Créer le répertoire de données pour le montage de volume
RUN mkdir -p /data

# Définir la variable d'environnement pour le répertoire de données
ENV DATA_DIR=/data

# Exposer le port
EXPOSE 3000

# Démarrer l'application
CMD ["npm", "start"]
