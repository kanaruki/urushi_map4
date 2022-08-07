class AddIsOPensToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :is_open, :boolean
  end
end
