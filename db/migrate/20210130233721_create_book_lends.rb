class CreateBookLends < ActiveRecord::Migration[5.2]
  def change
    create_table :book_lends do |t|
      t.references :book
      t.references :lend

      t.timestamps
    end
  end
end
