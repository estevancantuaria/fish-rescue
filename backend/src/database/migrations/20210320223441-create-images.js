'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {

      return queryInterface.createTable('images', { 
        
        id: {
          type: Sequelize.INTEGER,
          allowNull: false,
          autoIncrement: true,
          primaryKey: true,
        },
        base_64: {
          type: Sequelize.STRING,
          allowNull: false,
        },
        rescue_id:{
          type:Sequelize.INTEGER,
          allowNull:false,
          references:{model:'rescues', key:'id'},
          onUpdate:'CASCADE',
          onDelete:'CASCADE'
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

      return queryInterface.dropTable('users');
  
  }
};
