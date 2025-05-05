class VocabulariosController < ApplicationController
  before_action :set_vocabulario, only: %i[ show edit update destroy ]

  # GET /vocabularios or /vocabularios.json
  def index
    @vocabularios = Vocabulario.all
  end

  # GET /vocabularios/1 or /vocabularios/1.json
  def show
  end

  # GET /vocabularios/new
  def new
    @vocabulario = Vocabulario.new
  end

  # GET /vocabularios/1/edit
  def edit
  end

  # POST /vocabularios or /vocabularios.json
  def create
    @vocabulario = Vocabulario.new(vocabulario_params)

    respond_to do |format|
      if @vocabulario.save
        format.html { redirect_to @vocabulario, notice: "Vocabulario was successfully created." }
        format.json { render :show, status: :created, location: @vocabulario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vocabulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vocabularios/1 or /vocabularios/1.json
  def update
    respond_to do |format|
      if @vocabulario.update(vocabulario_params)
        format.html { redirect_to @vocabulario, notice: "Vocabulario was successfully updated." }
        format.json { render :show, status: :ok, location: @vocabulario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vocabulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vocabularios/1 or /vocabularios/1.json
  def destroy
    @vocabulario.destroy!

    respond_to do |format|
      format.html { redirect_to vocabularios_path, status: :see_other, notice: "Vocabulario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vocabulario
      @vocabulario = Vocabulario.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def vocabulario_params
      params.expect(vocabulario: [ :nome ])
    end
end
