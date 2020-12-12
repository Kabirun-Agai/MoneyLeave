class AddYearmonthToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :year_month, :integer
  end
end
