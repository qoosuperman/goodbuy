class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
  end

  def my
  end

  def new
    @group = Group.new
  end

  def create
    
    clean_params = params.require(:groups).permit(:title, :description, :address, :phone, :is_active, :start_time, :end_time, :is_public, products_attributes:[:name, :price, :_destroy], options_attributes:[:name, :price, :_destroy])
    @group = Group.new(clean_params)
    if @group.save
      redirect_to my_groups_path
    else
      redirect_to new_group_path
    end
    
  end
end
