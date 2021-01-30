class AddLenddayToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :lendday, :datetime
  end
end
