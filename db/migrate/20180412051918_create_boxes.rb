class CreateBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :boxes do |t|
      t.string :color
      t.string :points
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
