class AtendimentosController < ApplicationController
  before_action :set_atendimento, only: %i[ show edit update destroy ]

  # GET /atendimentos or /atendimentos.json
  def index
    @atendimentos = Atendimento.all
    # Se você também quiser a lista de vocabulário na index de atendimentos, adicione aqui:
    @vocabulariopalavras = Vocabulariopalavra.all
  end

  # GET /atendimentos/1 or /atendimentos/1.json
  def show

    # *** ADICIONE OU CONFIRME QUE ESTA LINHA EXISTE AQUI: ***
    @vocabulariopalavras = Vocabulariopalavra.all
    # *****************************************************

  end

  # GET /atendimentos/new
  def new
    @atendimento = Atendimento.new
  end

  # GET /atendimentos/1/edit
  def edit
  end

  # POST /atendimentos or /atendimentos.json
  def create
    @atendimento = Atendimento.new(atendimento_params)

    respond_to do |format|
      if @atendimento.save
        format.html { redirect_to @atendimento, notice: "Atendimento was successfully created." }
        format.json { render :show, status: :created, location: @atendimento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atendimentos/1 or /atendimentos/1.json
  def update
    respond_to do |format|
      if @atendimento.update(atendimento_params)
        format.html { redirect_to @atendimento, notice: "Atendimento was successfully updated." }
        format.json { render :show, status: :ok, location: @atendimento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atendimentos/1 or /atendimentos/1.json
  def destroy
    @atendimento.destroy!

    respond_to do |format|
      format.html { redirect_to atendimentos_path, status: :see_other, notice: "Atendimento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # POST /atendimentos/:id/importar_palavras_vocabulario
  # Action para ler palavras de 'vocabulariopalavras' e gravar em 'atendimentopalavras'
  def importar_palavras_vocabulario

    # *** ADICIONAR VERIFICAÇÃO SE @atendimento FOI DEFINIDO CORRETAMENTE ***
    # Se set_atendimento falhou em encontrar o atendimento (e retornou nil),
    # esta condição será verdadeira.
    unless @atendimento
      Rails.logger.error "Atendimento com ID #{params[:id]} não encontrado para importar palavras."
      # Redireciona para a lista de atendimentos, pois não temos um atendimento específico
      redirect_to atendimentos_url, alert: "Atendimento não encontrado."
      return # Interrompe a execução da action para evitar o erro 'Cannot redirect to nil!'
    end
    # *********************************************************************

    # Busca todos os registros da tabela vocabulariopalavras
    palavras_do_vocabulario = Vocabulariopalavra.all

    # Inicializa um contador para saber quantas palavras foram importadas
    contador_importadas = 0

    # Itera sobre cada palavra encontrada no vocabulário
    palavras_do_vocabulario.each do |palavra_vocab|
      # Adiciona um bloco begin/rescue para tratar erros ao processar CADA palavra.
      # Isso evita que um erro em uma palavra específica pare todo o processo.
      begin
        # Cria um novo registro na tabela atendimentopalavras associado ao @atendimento
        # Assumimos que 'atendimentopalavras' tem uma coluna 'palavra'
        # e possivelmente uma coluna 'vocabulariopalavra_id' para referência
        # e que o Model 'Atendimentopalavra' tem 'belongs_to :atendimento'
        nova_palavra_atendimento = @atendimento.atendimentopalavras.new(
          palavra: palavra_vocab.palavra, # Copia o valor da coluna 'palavra'
          vocabulariopalavra_id: palavra_vocab.id # Opcional: Copia o ID original do vocabulário
          # Adicione outras colunas se necessário, mapeando os dados
        )

        # Tenta salvar o novo registro no banco de dados
        if nova_palavra_atendimento.save
          contador_importadas += 1
        else
          # Se houver erro ao salvar (ex: validação no Model), loga o erro específico
          Rails.logger.error "Falha ao salvar Atendimentopalavra para a palavra '#{palavra_vocab.palavra}' (ID Vocab: #{palavra_vocab.id}): #{nova_palavra_atendimento.errors.full_messages.join(', ')}"
          # Você pode escolher como lidar com falhas (parar, pular, etc.). Aqui, apenas logamos e continuamos.
        end
      rescue => individual_e
        # Captura qualquer erro inesperado que ocorra ao processar esta palavra individual
        Rails.logger.error "Erro ao processar palavra do vocabulário ID #{palavra_vocab.id}: #{individual_e.message}"
      end
    end

    # Redireciona o usuário de volta para a página do atendimento com uma mensagem de sucesso
    redirect_to @atendimento, notice: "#{contador_importadas} palavras do vocabulário importadas com sucesso para este atendimento."
  rescue => e
    # Este bloco rescue captura erros que ocorram ANTES do loop (se a verificação inicial falhar por algum motivo)
    # ou erros que ocorram DEPOIS do loop, ou exceções não capturadas pelo rescue interno.
    Rails.logger.error "Erro geral ao importar palavras do vocabulário para Atendimento ID #{params[:id]}: #{e.message}"
    # Redireciona para a lista de atendimentos se @atendimento for nil (embora a verificação inicial já trate isso),
    # caso contrário, redireciona para o atendimento específico.
    # A expressão (@atendimento || atendimentos_url) garante que sempre haverá um destino válido.
    redirect_to (@atendimento || atendimentos_url), alert: "Ocorreu um erro ao importar as palavras do vocabulário."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atendimento
      @atendimento = Atendimento.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def atendimento_params
      params.expect(atendimento: [ :data, :descricao, :status, :paciente_id, :profissional_id ])
    end  
end
