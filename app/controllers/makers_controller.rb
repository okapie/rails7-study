class MakersController < ApplicationController
  before_action :set_maker, only: %i[ show edit update destroy ]

  # GET /makers or /makers.json
  def index
    @makers = Maker.all
  end

  # GET /makers/1 or /makers/1.json
  def show
  end

  # GET /makers/new
  def new
    @maker = Maker.new
  end

  # GET /makers/1/edit
  def edit
  end

  # POST /makers or /makers.json
  def create
    @maker = Maker.new(maker_params)

    respond_to do |format|
      if @maker.save
        format.html { redirect_to maker_url(@maker), notice: "Maker was successfully created." }
        format.json { render :show, status: :created, location: @maker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /makers/1 or /makers/1.json
  def update
    respond_to do |format|
      if @maker.update(maker_params)
        format.html { redirect_to maker_url(@maker), notice: "Maker was successfully updated." }
        format.json { render :show, status: :ok, location: @maker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /makers/1 or /makers/1.json
  def destroy
    @maker.destroy

    respond_to do |format|
      format.html { redirect_to makers_url, notice: "Maker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maker
      @maker = Maker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maker_params
      params.require(:maker).permit(:name)
    end
end
