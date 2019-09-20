class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
  end

  def my
  end

  def new
    @group = Group.new
  end
end
