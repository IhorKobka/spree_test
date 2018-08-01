class CreateSpreeCustomCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_custom_categories do |t|
      t.bigint :parent_id
      t.string :name, limit: 50, null: false
      t.integer :pos, null: false

      t.timestamps
    end
  end
end
