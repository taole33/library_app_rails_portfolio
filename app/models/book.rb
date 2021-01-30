class Book < ApplicationRecord
    has_many :book_user
    has_many :users, through: :book_user
    has_many :book_library
    has_many :libraries, through: :book_library

    def self.search(search)
      #Book.where('isbn LIKE ? OR name LIKE ? OR author LIKE ?　OR publisher LIKE ?', "%#{search[0]}%","%#{search[1]}%","%#{search[2]}%","%#{search[3]}%")
      Book.where('isbn LIKE ?', "%#{search[0]}%")
    end
end
