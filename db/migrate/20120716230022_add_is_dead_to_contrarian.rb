class AddIsDeadToContrarian < ActiveRecord::Migration
  def change
    add_column :contrarians, :is_dead, :boolean
  end
end
