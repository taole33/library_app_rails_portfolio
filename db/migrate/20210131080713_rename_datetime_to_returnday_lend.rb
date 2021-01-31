class RenameDatetimeToReturndayLend < ActiveRecord::Migration[5.2]
  def change
    change_column :lends, :datetime, :returnday
  end
end
