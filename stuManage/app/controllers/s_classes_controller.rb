class SClassesController < ApplicationController
  before_action :set_s_class, only: [:show, :edit, :update, :destroy]

  # GET /s_classes
  # GET /s_classes.json
  def index
    @s_classes = SClass.all
  end

  # GET /s_classes/1
  # GET /s_classes/1.json
  def show
  end

  # GET /s_classes/new
  def new
    @s_class = SClass.new
  end

  # GET /s_classes/1/edit
  def edit
  end

  # POST /s_classes
  # POST /s_classes.json
  def create
    @s_class = SClass.new(s_class_params)

    respond_to do |format|
      if @s_class.save
        format.html { redirect_to @s_class, notice: 'S class was successfully created.' }
        format.json { render :show, status: :created, location: @s_class }
      else
        format.html { render :new }
        format.json { render json: @s_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /s_classes/1
  # PATCH/PUT /s_classes/1.json
  def update
    respond_to do |format|
      if @s_class.update(s_class_params)
        format.html { redirect_to @s_class, notice: 'S class was successfully updated.' }
        format.json { render :show, status: :ok, location: @s_class }
      else
        format.html { render :edit }
        format.json { render json: @s_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /s_classes/1
  # DELETE /s_classes/1.json
  def destroy
    @s_class.destroy
    respond_to do |format|
      format.html { redirect_to s_classes_url, notice: 'S class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_s_class
      @s_class = SClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def s_class_params
      params.require(:s_class).permit(:class_name, :teacher_id, :year, :grade_id)
    end
end
