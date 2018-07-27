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


    def absolute_dealings_left_array(user)
        usersleft = userpos(user)
        dealings_left_array = []

        entitled_hash.first(usersleft).each do |u|
            dealings_left_array << calculate_dealing(u)
        end

        updated_entitled(user,dealings_left_array)

        dealings_left_array
    end

    def userpos(user)
        entitled_hash.index([user,self.entitled(user)])
    end

    def calculate_dealing(user)
        (self.entitled(user)/ group.members.count - userpos(user)).abs
    end

    def sum_of_dealings_left(array)
        array.inject do |running_total, num|
            running_total + num
        end
    end

    def updated_entitled(user,dealings_left_array)
        self.entitled(user) + sum_of_dealings_left(dealings_left_array)
    end

end
