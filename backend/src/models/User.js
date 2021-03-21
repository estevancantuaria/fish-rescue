const {Model, DataTypes} = require('sequelize');
const bcrypt = require('bcryptjs');

class User extends Model {
  static init(sequelize) {
    super.init(
      {
        name: DataTypes.STRING,
        email: DataTypes.STRING,
        password: DataTypes.VIRTUAL,
        password_hash: DataTypes.STRING,
      },
      {
        sequelize,
      }
    );

    this.addHook('beforeSave', async user => {
      if (user.password) {
        user.password_hash = await bcrypt.hash(user.password, 8);
      }
    });

    return this;
  }

  static associate(models){
    this.hasMany(models.Rescue,{foreignKey:'user_id', as:'rescues'})
  }

}

module.exports = User;


