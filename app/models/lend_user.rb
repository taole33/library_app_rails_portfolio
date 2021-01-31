class LendUser < ApplicationRecord
    belongs_to :lend
    belongs_to :user
end
