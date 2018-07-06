class EntriesController < ApplicationController
    before_action :set_group

    def create
        @entry = Entry.new(entry_params)
        @entry.user = current_user
        @entry.ledger = @group.ledger
        if @entry.save!
            redirect_to group_path(@group)
        else
            redirect_to root_path
        end
    end

    private

    def set_group
        @group = Group.find(params[:group_id])
    end

    def entry_params
        params.require(:entry).permit(:amount,:group,:user)
    end


end
