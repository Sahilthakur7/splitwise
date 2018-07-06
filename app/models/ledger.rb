class Ledger < ApplicationRecord
    belongs_to :group
    validates :group, presence: true
    has_many :entries
end
