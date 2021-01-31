class ChangeDatatypeLenddateOfLend < ActiveRecord::Migration[5.2]
  def change
    change_column :lends, :lenddate, :date
  end
end
