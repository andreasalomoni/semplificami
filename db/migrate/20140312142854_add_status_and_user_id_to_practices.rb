class AddStatusAndUserIdToPractices < ActiveRecord::Migration
  def change
    add_column :practices, :practice_status, :integer
    add_column :practices, :user_id, :integer
  end
end
