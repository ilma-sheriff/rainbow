class SchoolsController < ApplicationController
  before_action  only: [:show, :edit, :update, :destroy]


  def index
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
    redirect_to new_school_url
  end

  # GET /clocks/new
  def new
      @school = School.new
  end

  # GET /clocks/1/edit
  #def edit
  #end

  # POST /clocks
  # POST /clocks.json
  def create
    @school = School.new(:name => params[:name].to_s, :address => params[:address].to_s)

    respond_to do |format|
      if @school.save!
        format.html {redirect_to schools_path, notice: 'School was successfully created.'}
        format.json { render :show, status: :ok, location:  @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update

    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location:  @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school = School.find(params[:id].to_s)
    @school.destroy
    respond_to do |format|
      format.html { redirect_to school_url, notice: 'School was successfully destroyed.' }
      format.json { head :no_content }
    end
    return
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def school_params
    params.require(:school).permit(:name, :address)
  end
end
