class AddLibraryToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :library, :string
  end
end
