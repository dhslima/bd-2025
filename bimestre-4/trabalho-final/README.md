npm init -y

# dependências

npm i express sequelize pg pg-hstore

# dev deps

npm i -D sequelize-cli nodemon

npx sequelize-cli init

# Isso criará

config/config.json # vamos substituir por config.js
models/
migrations/
seeders/

# para executar

npm run dev
