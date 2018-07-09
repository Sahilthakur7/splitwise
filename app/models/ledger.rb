class Ledger < ApplicationRecord
    belongs_to :group
    validates :group, presence: true
    has_many :entries

    def update_total(amount)
        self.update_attributes(total_spent: self.total_spent + amount)
        self.group.update_total(amount)
    end

end
