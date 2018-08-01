class CreateSpreeCustomProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_custom_products do |t|
      t.string :name, limit: 100, null: false
      t.references :spree_custom_category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
