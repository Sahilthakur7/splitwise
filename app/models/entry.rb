class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :ledger

   validates :ledger, presence: true
   validates :user , presence: true 
  validates :amount , presence: true
end
