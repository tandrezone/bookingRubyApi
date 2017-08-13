class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :car
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
