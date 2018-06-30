class GroupsController < ApplicationController
    before_action :set_group , only: [:show]
    def index
        @groups = {groups: current_user.groups}
    end

    def show
        @group_prop = {group: @group, members: @group.members}
    end

    def new
        @group = Group.new
    end

    def create
        @group = Group.create(group_params)
        @group.generate_identifier
        current_user.join(@group)

        if(@group.save)
            @group.generate_identifier
            flash[:success] = "Group has been created."
            redirect_to user_groups_path(current_user)
        else
            redirect_to root_path
        end
    end

    private

    def group_params
        params.require(:group).permit(:name)
    end

    def set_group
        @group = Group.find(params[:id])
    end
end
