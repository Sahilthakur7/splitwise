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
        absolute_dealings_left_array = []


        absolute_dealings_left_array = entitled_hash.first(usersleft).map.with_index do |u,i|
            calculate_absolute_dealing(u[0],i)
        end

        absolute_dealings_left_array
    end

    def dealings_left_array(user)

        usersleft = userpos(user)
        dealings_left_array = []

        dealings_left_array = entitled_hash.first(usersleft).map.with_index do |u,i|
            calculate_dealing(u[0],i)
        end

        dealings_left_array
    end

    def array_to_return(user)
        usersleft = userpos(user)
        array_to_return = []

        array_to_return = entitled_hash.first(usersleft).map.with_index do |u,i|
            calculate_return_dealing(u[0],i)
        end

        array_to_return
    end
    

    def userpos(user)
        entitled_hash.index([user,self.entitled(user)])
    end

    def calculate_absolute_dealing(user,i)
        ((self.entitled(user)) / ( self.group.members.count - i - 1)).abs
    end

    def calculate_dealing(user,i)
        (self.updated_entitled(user)) / ( self.group.members.count - i - 1).abs
    end

    def calculate_return_dealing(user,i)
        (self.updated_final_entitled(user)) / ( self.group.members.count - i - 1).abs
    end

    def updated_entitled(user)
        (self.entitled(user)  + self.absolute_sum(user).to_i).abs
    end

    def updated_final_entitled(user)
        (self.entitled(user)  + self.absolute_final_sum(user).to_i).abs
    end

    def absolute_sum(user)
        self.absolute_dealings_left_array(user).reduce(&:+)
    end

    def absolute_final_sum(user)
        self.dealings_left_array(user).reduce(&:+)
    end


end
