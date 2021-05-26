class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.references :buyer, null: false
      t.references :seller, null: false
      t.decimal :money, precision: 10, scale: 2, null: false
      t.boolean :accepted, default: false
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
