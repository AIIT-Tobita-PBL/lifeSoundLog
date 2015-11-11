class CreateUploaders < ActiveRecord::Migration
  def change
    create_table :uploaders do |t|
      t.text :filename
      t.text :filepath
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
