class AddFieldnameToContrarian < ActiveRecord::Migration
  def change
    add_column :contrarians, :image_url, :string
  end
end
