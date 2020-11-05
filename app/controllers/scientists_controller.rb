class ScientistsController < ApplicationController
    before_action :set_scientist, only: [:show, :edit, :update, :destroy]

    def index
        @scientists = Scientist.all 
        render :index 
    end

    def show
        render :show 
    end

    def new
        @scientist = Scientist.new 
        render :new 
    end

    def create
        scientist = Scientist.create(scientist_params)
        if scientist.valid?
            redirect_to scientist_path(scientist)
        else
            flash[:errors] = scientist.errors.full_messages
            redirect_to new_scientist_path
        end
    end

    def edit 
        render :edit 
    end

    def update
        if @scientist.update(scientist_params)
            redirect_to scientist_path(@scientist)
        else
            flash[:errors] = @scientist.errors.full_messages
            redirect_to edit_scientist_path
        end
    end

    def destroy  
        @scientist.destroy 
        redirect_to scientists_path
    end
    
    private

    def scientist_params
        params.require(:scientist).permit(:name, :field_of_study)
    end

    def set_scientist
        @scientist = Scientist.find(params[:id])
    end
end