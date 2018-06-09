class GroupsController < ApplicationController
    def index
        @groups = {groups: current_user.groups}
    end
end
