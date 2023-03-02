class CreateAnimal < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.string :image
      t.string :name
      t.integer :age
      t.string :breed
      t.string :gender
      t.integer :owner_id
    end
  end
end
