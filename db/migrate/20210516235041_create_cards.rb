class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.decimal :price, precision: 10, scale: 2
      t.integer :qty, null: false, default: 1

      t.timestamps
    end
  end
end
