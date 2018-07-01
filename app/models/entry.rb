class Entry < ApplicationRecord
  belongs_to :member , class_name: 'User'
  belongs_to :ledger

  validates :ledger, presence: true
  validates :member , presence: true 
  validates :amount , presence: true
end
