const {Model, DataTypes} = require('sequelize');

class Rescue extends Model {
  static init(sequelize) {
    super.init(
      {
        nome_usina: DataTypes.STRING,
        condicoes_climaticas: DataTypes.STRING,
        casa_de_maquinas: DataTypes.STRING,
        vertedouros: DataTypes.STRING,
        escada_de_peixe: DataTypes.STRING,
        local_resgate: DataTypes.STRING,
        distancia_aprox: DataTypes.DECIMAL,
        especie_resgatada: DataTypes.STRING,
        tamanho_medio: DataTypes.DECIMAL,
        peso_medio:DataTypes.DECIMAL,
        quantidade_recolhida:DataTypes.INTEGER,
        lesoes_observadas:DataTypes.STRING
      },
      {
        sequelize,
      }
    );

    return this;
  }

  
  static associate(models){
    this.belongsTo(models.User, {foreignKey:'user_id', as:'user'})
  }

  static associate(models){
    this.hasMany(models.Image,{foreignKey:'image_id', as:'images'})
  }

}

module.exports = Rescue;