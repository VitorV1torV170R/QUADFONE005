class AtendimentopalavrasController < ApplicationController
  before_action :set_atendimentopalavra, only: %i[ show edit update destroy ]

  # GET /atendimentopalavras or /atendimentopalavras.json
  def index
    @atendimentopalavras = Atendimentopalavra.all
  end

  # GET /atendimentopalavras/1 or /atendimentopalavras/1.json
  def show
  end

  # GET /atendimentopalavras/new
  def new
    @atendimentopalavra = Atendimentopalavra.new
  end

  # GET /atendimentopalavras/1/edit
  def edit
  end

  # POST /atendimentopalavras or /atendimentopalavras.json
  def create
    @atendimentopalavra = Atendimentopalavra.new(atendimentopalavra_params)

    respond_to do |format|
      if @atendimentopalavra.save
        format.html { redirect_to @atendimentopalavra, notice: "Atendimentopalavra was successfully created." }
        format.json { render :show, status: :created, location: @atendimentopalavra }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @atendimentopalavra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atendimentopalavras/1 or /atendimentopalavras/1.json
  def update
    respond_to do |format|
      if @atendimentopalavra.update(atendimentopalavra_params)
        format.html { redirect_to @atendimentopalavra, notice: "Atendimentopalavra was successfully updated." }
        format.json { render :show, status: :ok, location: @atendimentopalavra }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @atendimentopalavra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atendimentopalavras/1 or /atendimentopalavras/1.json
  def destroy
    @atendimentopalavra.destroy!

    respond_to do |format|
      format.html { redirect_to atendimentopalavras_path, status: :see_other, notice: "Atendimentopalavra was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atendimentopalavra
      @atendimentopalavra = Atendimentopalavra.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def atendimentopalavra_params
      params.expect(atendimentopalavra: [ :palavra, :transcricao ])
    end
end
