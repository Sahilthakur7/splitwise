class GroupsController < ApplicationController
    def index
        @groups = {groups: current_user.groups}
    end

    def new
        @group = Group.new
        if(@group.save)
            redirect_to user_groups_path(current_user)
        else
            redirect_to root_path
        end
    end

    private

    def group_params
        params.require(:group).permit(:name,:members)
    end
end
