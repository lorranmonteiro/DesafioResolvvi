class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    # Recebe todos os clientes que podem ser usados na view index
    @clients = Client.all
    # Recebe todos os advogados  que podem ser usados na view index
    @lawyers = Lawyer.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    # Recebe todos os advogados que podem ser usados na view show
	  @lawyers = Lawyer.all
    @states = State.all

    @check = 0
    @NumLaw = 0
    @AvailebleLawyers = []

    for i in 0..@lawyers.length-1                                    
      if ((@client.state).upcase).split == (@lawyers[i].state).split    #*clients[0] -> Deve ser o cliente     
                                                                        # cadastrado       
          @AvailebleLawyers[@NumLaw] = @lawyers[i]
          @NumLaw += 1                                             
          @check = 1  
      end   
    end 

    if @check == 0
       @IdealLawyer = 0 
    else 
      for j in 0..@states.length-1

        if @AvailebleLawyers[0].state == @states[j].name

          save = j
          break
        end  
      end

      for i in 0..@AvailebleLawyers.length-1

        if (@states[save].interaction ).to_i > @AvailebleLawyers.length

          @states[save].interaction = "1"
        end 

        if @AvailebleLawyers[i].order == @states[save].interaction
          
          @IdealLawyer = @AvailebleLawyers[i]
          break
        end
      end 
  
      @states[save].interaction = ((@states[save].interaction).to_i + 1).to_s
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