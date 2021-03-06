class UsersController < ApplicationController
  include SessionHelper
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # if logged_in?
    #   @user = User.find(session[:user_id])
    #   render plain: @user
    # else
    #   render plain: "Loggedout"
    #   @user = User.find(params[:id])
    # end
    @user = User.find_by id: params[:id]
  end

  # GET /users/new
  def new
    @current_page = 'register'
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @current_page = 'edit'
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        # redirect_to @user
        # format.html { redirect_to users_path, notice: 'User was successfully created !!!.' }
        format.html { redirect_to @user, notice: 'User was successfully created !!!.' }
        format.json { render :show, status: :created, location: @user }
        # format.json { render :index, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    if logged_in?
      @user = User.find(session[:user_id])
      # render plain: @user
    else
      # render plain: "Loggedout"
      @user = User.find(params[:id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:id, :user_name, :password, :password_confirmation, :full_name, :role, :class_id)
  end
end
