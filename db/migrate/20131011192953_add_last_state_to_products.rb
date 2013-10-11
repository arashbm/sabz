class AddLastStateToProducts < ActiveRecord::Migration
  def change
    add_column :products, :last_state, :string
  end
end
