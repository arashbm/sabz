class ChangeDiscriptionToTextInRequests < ActiveRecord::Migration
  def change
    change_column :requests, :discription, :text
  end
end
