'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('rescues', { 
        
      id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
      },
      user_id:{
        type:Sequelize.INTEGER,
        allowNull:false,
        references:{model:'users', key:'id'},
        onUpdate:'CASCADE',
        onDelete:'CASCADE'
      },
      nome_usina: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      condicoes_climaticas:{
        type: Sequelize.STRING,
        allowNull: true
      },
      casa_de_maquinas: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      vertedouros: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      escada_de_peixe: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      local_resgate: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      distancia_aprox: {
        type: Sequelize.DECIMAL,
        allowNull: true,
      },
      especie_resgatada: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      tamanho_medio: {
        type: Sequelize.DECIMAL,
        allowNull: true,
      },
      peso_medio: {
        type: Sequelize.DECIMAL,
        allowNull: true,
      },
      quantidade_recolhida: {
        type: Sequelize.INTEGER,
        allowNull: true,
      },
      lesoes_observadas: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      created_at: {
        type: Sequelize.DATE,
        allowNull: false,
      },
      updated_at: {
        type: Sequelize.DATE,
        allowNull: false,
      }, 
       
    });
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('rescues');
  }
};
