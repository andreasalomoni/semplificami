class PracticesController < ApplicationController
  before_action :set_practice, only: [:show, :edit, :update, :destroy]

  # GET /practices
  # GET /practices.json
  def index
    @practices = Practice.all
  end

  # GET /practices/1
  # GET /practices/1.json
  def show
  end

  # GET /practices/new
  def new
    @practice = Practice.new
    @practice.build_sentence
    @practice.build_marriage_act
    @practice.user = current_user
  end

  # GET /practices/1/edit
  def edit
  end

  # POST /practices
  # POST /practices.json
  def create
    @practice = Practice.new(practice_params)
    @practice.user = current_user

    respond_to do |format|
      if @practice.save
        format.html { redirect_to @practice, notice: 'Practice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @practice }
      else
        format.html { render action: 'new' }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /practices/1
  # PATCH/PUT /practices/1.json
  def update
    respond_to do |format|
      if @practice.update(practice_params)
        format.html { redirect_to @practice, notice: 'Practice was successfully updated.' }
        format.json { render json: {files: [@practice.to_jq_upload(practice_params[:document])]}, status: :created, location: @practice }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /practices/1
  # DELETE /practices/1.json
  def destroy
    @practice.destroy
    respond_to do |format|
      format.html { redirect_to practices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_practice
      @practice = Practice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def practice_params
      params.require(:practice).permit(:practice_type, :presentation_date, :sentence_id, :actor_id, :defendant_id, :magistrate_id, :marriage_act_id, sentence_attributes: [:number, :year, :sentence_date, :publication_date, :role_number, :role_year], marriage_act_attributes: [:number, :year, :registry, :part, :serie, :marriage_date], document: [:attachmentStream])
    end
end
