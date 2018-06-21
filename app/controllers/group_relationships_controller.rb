class GroupRelationshipsController < ApplicationController
    def new
        @group_relationship = GroupRelationship.new
    end

    def create
        @group = Group.where(identifier: params[:GroupIdentifier])
        current_user.join(@group)
        redirect_to user_groups_path(current_user)
    end

    private

    def group_relationships_params
        params.require(:group_relationship)
    end
end
