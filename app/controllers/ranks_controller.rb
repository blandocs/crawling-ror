class RanksController < ApplicationController
  before_action :set_rank, only: [:edit, :update, :destroy]

  # GET /ranks
  # GET /ranks.json
  def index
     
  end

  # GET /ranks/1
  # GET /ranks/1.json
  def show 
    
  end
  
  def show_food
    @food = params[:food]
    @ranks = Rank.where(food: params[:food])
    @star_average = Rank.where(food: params[:food]).average(:star)
  end

  # GET /ranks/new
  def new
    @rank = Rank.new(food: params[:food])
    @food = params[:food]
  end

  # GET /ranks/1/edit
  def edit
  end

  # POST /ranks
  # POST /ranks.json
  def create
    @rank = Rank.new(rank_params)
    
    respond_to do |format|
      if @rank.save
        format.html { redirect_to action: "show_food", food: params[:rank][:food], notice: 'Rank was successfully created.' }
        format.json { render :show, status: :created, location: @rank }
      else
        format.html { render :new }
        format.json { render json: @rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ranks/1
  # PATCH/PUT /ranks/1.json
  def update
    respond_to do |format|
      if @rank.update(rank_params)
        format.html { redirect_to @rank, notice: 'Rank was successfully updated.' }
        format.json { render :show, status: :ok, location: @rank }
      else
        format.html { render :edit }
        format.json { render json: @rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ranks/1
  # DELETE /ranks/1.json
  def destroy
    @rank.destroy
    respond_to do |format|
      format.html { redirect_to ranks_url, notice: 'Rank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rank
      @rank = Rank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rank_params
      params.require(:rank).permit(:nickname, :content, :star, :food)
    end
end
