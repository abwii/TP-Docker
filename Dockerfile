# Utilisez une image de base Node.js
FROM node:14

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez le package.json et le package-lock.json dans le conteneur
COPY package*.json ./

# Installez les dépendances du projet
RUN npm install

# Copiez le reste des fichiers du projet dans le conteneur
COPY . .

# Installez MongoDB
RUN apt-get update && apt-get install -y mongodb

# Exposez le port sur lequel votre application écoute
EXPOSE 3000

# Démarrez MongoDB
CMD mongod &

# Démarrez votre application lorsque le conteneur démarre
CMD [ "npm", "start" ]
