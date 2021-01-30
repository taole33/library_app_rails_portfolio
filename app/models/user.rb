class User < ApplicationRecord
    has_many :book_user
    has_many :books, through: :book_user
end
