class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :image_name, default: "default.png"
      t.text :bio

      t.timestamps
    end
  end
end
