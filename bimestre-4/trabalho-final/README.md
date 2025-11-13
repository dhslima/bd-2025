Criem uma pasta para o projeto e entrem nela. Então executem:

npm init -y

# dependências

npm i express sequelize pg pg-hstore

# dev deps

npm i -D sequelize-cli nodemon

npx sequelize-cli init

# Isso criará

config/config.json

models/

migrations/

seeders/

# para executar o exemplo, dentro da pasta trabalho-final executem

npm run dev
