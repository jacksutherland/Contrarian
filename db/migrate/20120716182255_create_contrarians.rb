class CreateContrarians < ActiveRecord::Migration
  def change
    create_table :contrarians do |t|
      t.string :name
      t.date :birth
      t.date :death
      t.text :description
      t.boolean :display

      t.timestamps
    end
  end
end
