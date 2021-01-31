class Book < ApplicationRecord
    validates :isbn, presence: true,length:{ maximum: 13 }, numericality:{only_integer: true}
    validates :name, presence: true
    validates :author, presence: true
    validates :publisher, presence: true
    validates :library, presence: true
    
    has_many :book_users
    has_many :users, through: :book_users
    has_many :book_libraries
    has_many :libraries, through: :book_libraries
    has_many :book_lends
    has_many :lends, through: :book_lends

    scope :isbn, -> (search) { where('isbn LIKE ?', "%#{search[0]}%") if search[0].present? } 
    scope :bookname, -> (search){ where('name LIKE ?', "%#{search[1]}%") if search[1].present? } 
    scope :author, -> (search){ where('author LIKE ?', "%#{search[2]}%") if search[2].present? } 
    scope :publisher, -> (search){ where('publisher LIKE ?', "%#{search[3]}%") if search[3].present? }
    scope :library, -> (search){ where('library LIKE ?', "%#{search[4]}%") if search[4].present? }
end
