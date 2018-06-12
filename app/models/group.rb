class Group < ApplicationRecord
    has_many :group_relationships
    has_many :members, through: :group_relationships, class_name: "User"
    validates :name, presence: true
    validates :identifier, presence: true, uniqueness: true

    def generate_identifier
        .update_attributes(identifier: ('a'..'z').to_a.shuffle[0,8].join)
    end
end
