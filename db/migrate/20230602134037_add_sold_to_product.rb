class AddSoldToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :sold, :boolean, default: false, null: false
  end
end
