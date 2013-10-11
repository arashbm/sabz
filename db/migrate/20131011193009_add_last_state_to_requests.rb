class AddLastStateToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :last_state, :string
  end
end
