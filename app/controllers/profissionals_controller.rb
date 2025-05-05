class ProfissionalsController < ApplicationController
  before_action :set_profissional, only: %i[ show edit update destroy ]

  # GET /profissionals or /profissionals.json
  def index
    @profissionals = Profissional.all
  end

  # GET /profissionals/1 or /profissionals/1.json
  def show
  end

  # GET /profissionals/new
  def new
    @profissional = Profissional.new
  end

  # GET /profissionals/1/edit
  def edit
  end

  # POST /profissionals or /profissionals.json
  def create
    @profissional = Profissional.new(profissional_params)

    respond_to do |format|
      if @profissional.save
        format.html { redirect_to @profissional, notice: "Profissional was successfully created." }
        format.json { render :show, status: :created, location: @profissional }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profissional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profissionals/1 or /profissionals/1.json
  def update
    respond_to do |format|
      if @profissional.update(profissional_params)
        format.html { redirect_to @profissional, notice: "Profissional was successfully updated." }
        format.json { render :show, status: :ok, location: @profissional }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profissional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profissionals/1 or /profissionals/1.json
  def destroy
    @profissional.destroy!

    respond_to do |format|
      format.html { redirect_to profissionals_path, status: :see_other, notice: "Profissional was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profissional
      @profissional = Profissional.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def profissional_params
      params.expect(profissional: [ :nome, :endereço, :telefone, :email ])
    end
end
