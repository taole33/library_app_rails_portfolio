class Lend < ApplicationRecord
    has_many :book_lends
    has_many :books, through: :book_lends
    has_many :lend_users
    has_many :users, through: :lend_users
    accepts_nested_attributes_for :books
    accepts_nested_attributes_for :users
end
