class CreateBookLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :book_libraries do |t|
      t.references :book, index: true
      t.references :library, index: true
      
      t.timestamps
    end
  end
end
