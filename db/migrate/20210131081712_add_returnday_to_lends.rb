class AddReturndayToLends < ActiveRecord::Migration[5.2]
  def change
    add_column :lends, :returnday, :date
  end
end
