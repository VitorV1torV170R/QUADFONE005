class EmpresasController < ApplicationController
  before_action :set_empresa, only: %i[ show edit update destroy ]

  # GET /empresas or /empresas.json
  def index
    @empresas = Empresa.all
  end

  # GET /empresas/1 or /empresas/1.json
  def show
  end

  # GET /empresas/new
  def new
    @empresa = Empresa.new
  end

  # GET /empresas/1/edit
  def edit
  end

  # POST /empresas or /empresas.json
  def create
    @empresa = Empresa.new(empresa_params)

    respond_to do |format|
      if @empresa.save
        format.html { redirect_to @empresa, notice: "Empresa was successfully created." }
        format.json { render :show, status: :created, location: @empresa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empresas/1 or /empresas/1.json
  def update
    respond_to do |format|
      if @empresa.update(empresa_params)
        format.html { redirect_to @empresa, notice: "Empresa was successfully updated." }
        format.json { render :show, status: :ok, location: @empresa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1 or /empresas/1.json
  def destroy
    @empresa.destroy!

    respond_to do |format|
      format.html { redirect_to empresas_path, status: :see_other, notice: "Empresa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #Controlador para exibir os atendimentos ligados a empresa logada
  def atendimentos
    @empresa = Empresa.find(params[:id])
    # Se Atendimento tem empresa_id direto:
    # @atendimentos = Atendimento.where(empresa_id: @empresa.id)

    # Se Atendimento pertence a um cliente e cliente pertence à empresa:
    @atendimentos = Atendimento.joins(:cliente).where(clientes: { empresa_id: @empresa.id }).distinct
  end

  #Controlador para exibir os profissionais ligados a empresa logada
  def profissionals
    @empresa = Empresa.find(params[:id])
    @profissionals = Profissional.where(empresa_id: @empresa.id)
  end

  #Controlador para exibir os pacientes ligados a empresa logada
  def pacientes
    @empresa = Empresa.find(params[:id])
    @pacientes = Paciente.joins(:cliente).where(clientes: { empresa_id: @empresa.id }).distinct
  end  

  #Controlador para exibir os clientes ligados a empresa logada
  def clientes
    @empresa = Empresa.find(params[:id])
    @clientes = Cliente.where(empresa_id: @empresa.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def empresa_params
      params.expect(empresa: [ :nome, :cnpj, :endereco, :telefone, :email ])
    end
end
