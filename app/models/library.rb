class Library < ApplicationRecord
    has_many :book_library
    has_many :books, through: :book_library

    validates :library, presence: true
end
