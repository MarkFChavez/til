class CreateStuff < ActiveRecord::Migration
  def change
    create_table :stuffs do |t|
      t.column :content, :text

      t.timestamps
    end
  end
end
