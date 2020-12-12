class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :income
      t.integer :expense
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
