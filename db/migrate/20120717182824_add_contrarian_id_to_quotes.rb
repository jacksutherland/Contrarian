class AddContrarianIdToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :contrarian_id, :integer
  end
end
