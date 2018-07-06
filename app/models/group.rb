class Group < ApplicationRecord
    has_one :ledger
    has_many :group_relationships
    has_many :members, through: :group_relationships, class_name: "User"
    validates :name, presence: true
    validates :identifier, presence: true, uniqueness: true

    def generate_dependencies
        generate_identifier
        generate_ledger
    end

    def generate_identifier
        string = ('a'..'z').to_a.shuffle[0,8].join
        already_assigned = check(string)
        self.update_attributes(identifier: string) if already_assigned
    end

    def generate_ledger
        ledger = Ledger.new
        ledger.group = self
    end


    private

    def check(string)
        Group.where(identifier: string)
    end

end
