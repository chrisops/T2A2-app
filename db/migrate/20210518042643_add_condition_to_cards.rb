class AddConditionToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :condition, :string
  end
end
