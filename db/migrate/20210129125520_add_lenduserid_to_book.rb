class AddLenduseridToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :lenduserid, :integer
  end
end
