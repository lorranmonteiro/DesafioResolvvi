class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
    @lawyers = Lawyer.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
	  @lawyers = Lawyer.all
    @states = State.all

    @NumLaw = 0                    # Contador de posições do vetor @AvailableLawyers
    @AvailableLawyers = []

    for i in 0..@lawyers.length-1                                    
      if ((@client.state).upcase).split == (@lawyers[i].state).split    # Verificador Estado do cliente   
                                                                        #  = Estado do advogado   
          @AvailableLawyers[@NumLaw] = @lawyers[i]
          @NumLaw += 1                                              
      end   
    end 

    if @AvailableLawyers.empty?    # Se estiver vazio, retorna 0 e exibe na tela:
                                   #"Desculpe, não possuímos nenhum advogado cadastrado no seu estado."
       @IdealLawyer = 0 
                           
    else 

      for j in 0..@states.length-1

        if @AvailableLawyers[0].state == @states[j].name

          save = j                # Salva a posição do estado em questão
          break

        end  
      end

      for i in 0..@AvailableLawyers.length-1

        if (@states[save].interaction ).to_i > @AvailableLawyers.length  

          @states[save].interaction = "1"       # Caso o número de interações exceder o limite, dá reset

        end 

        if @AvailableLawyers[i].order == @states[save].interaction
          
          @IdealLawyer = @AvailableLawyers[i]   # Retorno do advogado na mesma ordem da interação
          break

        end
      end 
  
      @states[save].interaction = ((@states[save].interaction).to_i + 1).to_s # Crescendo a fila
      @states[save].save

    end
  end


  # GET /clients/new
  def new
    @client = Client.new
    @states = State.all
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