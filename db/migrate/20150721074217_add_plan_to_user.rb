class AddPlanToUser < ActiveRecord::Migration
  def change
    add_column :users, :plan_id, :integer # add column to users table, the new query is plan_id and its integer
  end
end
