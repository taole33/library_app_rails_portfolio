class BookLend < ApplicationRecord
    belongs_to :book
    belongs_to :lend

    
end
