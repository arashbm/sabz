class ChangeDiscriptionToTextInProducts < ActiveRecord::Migration
  def change
    change_column :products, :discription, :text
  end
end
