class CreateLogViews < ActiveRecord::Migration
  def change
    create_table :log_views do |t|
      t.references :user, index: true, foreign_key: true
      t.string :msg

      t.timestamps null: false
    end
  end
end
