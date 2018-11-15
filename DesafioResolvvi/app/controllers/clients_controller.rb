class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    # Recebe todos os clientes que podem ser usados na view index
    @clients = Client.all
    # Recebe todos os advogados  que podem ser usados na view index
    @lawyers = Lawyer.all
    @states = State.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    # Recebe todos os advogados que podem ser usados na view index
	  @lawyers = Lawyer.all

    # Pega aleatoriamente um advogado do mesmo estado
	  @lawyers.shuffle.each do |law|
      # Verifica se o estado do advogado é o mesmo do cliente
		  if law.state == (@client.state).upcase
        # Retorna o advogado disponivel
			  @lawyer = law
		  end
	  end
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Cliente cadastrado com sucesso!' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Cliente atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Cliente excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :state)
    end
end
