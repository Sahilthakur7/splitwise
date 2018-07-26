class Ledger < ApplicationRecord
    belongs_to :group
    validates :group, presence: true
    has_many :entries

    def update_total(amount)
        self.update_attributes(total_spent: self.total_spent + amount)
        self.group.update_total(amount)
    end

    def entitled(user)
        user_spent(user) - share
    end

    def share
        total_spent/self.group.members.count
    end

    def user_spent(user)
        entries.where(user: user).sum(:amount)
    end

    def entitled_hash #actually returns a nested array
        entitled_hash = {}
        self.group.members.each do |mem|
            entitled_hash.merge!(mem => entitled(mem))
        end
        entitled_hash.sort_by do |name,value|
            value
        end.reverse
    end





end
