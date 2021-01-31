class User < ApplicationRecord
    has_many :book_users
    has_many :books, through: :book_users
    has_many :lend_users
    has_many :lends, through: :lend_users

    validates :username, presence: true
    validates :userbirthday, presence: true
    validates :useraddress, presence: true
end
