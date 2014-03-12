class MarriageActsController < ApplicationController
  before_action :set_marriage_act, only: [:show, :edit, :update, :destroy]

  # GET /marriage_acts
  # GET /marriage_acts.json
  def index
    @marriage_acts = MarriageAct.all
  end

  # GET /marriage_acts/1
  # GET /marriage_acts/1.json
  def show
  end

  # GET /marriage_acts/new
  def new
    @marriage_act = MarriageAct.new
  end

  # GET /marriage_acts/1/edit
  def edit
  end

  # POST /marriage_acts
  # POST /marriage_acts.json
  def create
    @marriage_act = MarriageAct.new(marriage_act_params)

    respond_to do |format|
      if @marriage_act.save
        format.html { redirect_to @marriage_act, notice: 'Marriage act was successfully created.' }
        format.json { render action: 'show', status: :created, location: @marriage_act }
      else
        format.html { render action: 'new' }
        format.json { render json: @marriage_act.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marriage_acts/1
  # PATCH/PUT /marriage_acts/1.json
  def update
    respond_to do |format|
      if @marriage_act.update(marriage_act_params)
        format.html { redirect_to @marriage_act, notice: 'Marriage act was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @marriage_act.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marriage_acts/1
  # DELETE /marriage_acts/1.json
  def destroy
    @marriage_act.destroy
    respond_to do |format|
      format.html { redirect_to marriage_acts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marriage_act
      @marriage_act = MarriageAct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marriage_act_params
      params.require(:marriage_act).permit(:number, :year, :registry, :part, :serie, :marriage_date)
    end
end
