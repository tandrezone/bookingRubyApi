class ItemsController < ApplicationController
  before_action :set_user
  before_action :set_user_item, only: [:show, :update, :destroy]

  # GET /todos/:todo_id/items
  def index
    json_response(@user.items)
  end

  # GET /todos/:todo_id/items/:id
  def show
    json_response(@item)
  end

  # POST /todos/:todo_id/items
  def create
    @user.items.create!(item_params)
    json_response(@user, :created)
  end

  # PUT /todos/:todo_id/items/:id
  def update
    @item.update(item_params)
    head :no_content
  end

  # DELETE /todos/:todo_id/items/:id
  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :done)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_item
    @item = @user.items.find_by!(id: params[:id]) if @user
  end
end
