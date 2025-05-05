class VocabulariopalavrasController < ApplicationController
  before_action :set_vocabulariopalavra, only: %i[ show edit update destroy ]

  # GET /vocabulariopalavras or /vocabulariopalavras.json
  def index
    @vocabulariopalavras = Vocabulariopalavra.all
  end

  # GET /vocabulariopalavras/1 or /vocabulariopalavras/1.json
  def show
  end

  # GET /vocabulariopalavras/new
  def new
    @vocabulariopalavra = Vocabulariopalavra.new
  end

  # GET /vocabulariopalavras/1/edit
  def edit
  end

  # POST /vocabulariopalavras or /vocabulariopalavras.json
  def create
    @vocabulariopalavra = Vocabulariopalavra.new(vocabulariopalavra_params)

    respond_to do |format|
      if @vocabulariopalavra.save
        format.html { redirect_to @vocabulariopalavra, notice: "Vocabulariopalavra was successfully created." }
        format.json { render :show, status: :created, location: @vocabulariopalavra }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vocabulariopalavra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vocabulariopalavras/1 or /vocabulariopalavras/1.json
  def update
    respond_to do |format|
      if @vocabulariopalavra.update(vocabulariopalavra_params)
        format.html { redirect_to @vocabulariopalavra, notice: "Vocabulariopalavra was successfully updated." }
        format.json { render :show, status: :ok, location: @vocabulariopalavra }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vocabulariopalavra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vocabulariopalavras/1 or /vocabulariopalavras/1.json
  def destroy
    @vocabulariopalavra.destroy!

    respond_to do |format|
      format.html { redirect_to vocabulariopalavras_path, status: :see_other, notice: "Vocabulariopalavra was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vocabulariopalavra
      @vocabulariopalavra = Vocabulariopalavra.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def vocabulariopalavra_params
      params.expect(vocabulariopalavra: [ :palavra, :vocabulario_id ])
    end
end
