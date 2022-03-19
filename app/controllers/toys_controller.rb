class ToysController < ApplicationController
  before_action :set_toy, only: %i[ show edit update destroy ]
  before_action :set_current_member, only: [:bookmark, :remove_bookmark]

  # GET /toys or /toys.json
  def index
    @toys = Toy.all
  end

  def bookmark
    t = Toy.find(params[:id])
    m = Maker.find(t.selected_maker_id)
    s = Store.find(t.selected_store_id)

    if @member.present?
      @favorites.create(
        toy_id: t.id,
        member_id: m.id,
        toy_maker_name: m.name,
        toy_name: t.name,
        store_maker_name: m.name,
        store_name: s.name
      )
    end
  end

  def remove_bookmark
    @favorites.find_by(toy_id: params[:id]).destroy
  end

  # GET /toys/1 or /toys/1.json
  def show
  end

  # GET /toys/new
  def new
    @toy = Toy.new
  end

  # GET /toys/1/edit
  def edit
  end

  # POST /toys or /toys.json
  def create
    @toy = Toy.new(toy_params)

    respond_to do |format|
      if @toy.save
        Store.find(toy_params[:selected_store_id]).toys << @toy unless toy_params[:selected_store_id].empty?
        Maker.find(toy_params[:selected_maker_id]).toys << @toy unless toy_params[:selected_maker_id].empty?

        format.html { redirect_to toy_url(@toy), notice: "Toy was successfully created." }
        format.json { render :show, status: :created, location: @toy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @toy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /toys/1 or /toys/1.json
  def update
    respond_to do |format|
      if @toy.update(toy_params)
        Store.find(toy_params[:selected_store_id]).toys << @toy unless toy_params[:selected_store_id].empty?
        Maker.find(toy_params[:selected_maker_id]).toys << @toy unless toy_params[:selected_maker_id].empty?

        format.html { redirect_to toy_url(@toy), notice: "Toy was successfully updated." }
        format.json { render :show, status: :ok, location: @toy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @toy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /toys/1 or /toys/1.json
  def destroy
    @toy.destroy

    respond_to do |format|
      format.html { redirect_to toys_url, notice: "Toy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_toy
      @toy = Toy.find(params[:id])
    end

    def set_current_member
      @member = Member.find_by(user_id: current_user.id)
      @favorites = @member.favorites
    end

    # Only allow a list of trusted parameters through.
    def toy_params
      params.require(:toy).permit(:name, :buyable_id, :buyable_type, :selected_store_id, :selected_maker_id)
    end
end
