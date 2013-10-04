class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :sku
      t.string :manufacturer
      t.string :quantity
      t.string :discription
      t.string :url
      t.references :requester

      t.timestamps
    end
  end
end
