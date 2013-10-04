class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.references :provider, index: true
      t.string :manufacturer
      t.string :quantity
      t.string :discription
      t.string :url

      t.timestamps
    end
  end
end
