const {Model, DataTypes} = require('sequelize');

class Image extends Model {
  static init(sequelize) {
    super.init(
      {
        base_64: DataTypes.STRING,
      },
      {
        sequelize,
      }
    );

    return this;
  }

  static associate(models){
    this.belongsTo(models.Rescue, {foreignKey:'rescue_id', as:'rescue'})
  }

}

module.exports = Image;