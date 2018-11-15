# Desafio Resolvvi - Lorran Monteiro

class Estado
	attr_reader :NomeEstado
	attr_accessor :Interacao

	def initialize(nome,interacao)
		@NomeEstado = nome
		@Interacao = interacao
	end
end	

class Advogado
	attr_reader :NomeAdv, :EstadoAdv, :Ordem

	def initialize(nome,estado,ordem)
		@NomeAdv = nome
		@EstadoAdv = estado
		@Ordem = ordem
	end
end	

class Cliente

	attr_reader :NomeCliente, :EstadoCliente

	def initialize(nome,estado)
		@NomeCliente = nome
		@EstadoCliente = estado
	end
end

def CadastroDeClientes

	puts "Cadastro" + "\n"
	puts "Digite seu nome:"
	nome = gets

	puts "\n"

	puts "Digite a sigla do seu estado:"
	estado = (gets).upcase

	return Cliente.new(nome,estado)
end

def Match(cliente,advogados,estados)

	@verificador = 0
	@NumAdv = 0
	@AdvogadosDisponiveis = []
																					
	for i in 0..advogados.length-1   																# Checa todos os advogados cadastrados
		if (cliente.EstadoCliente).split == (advogados[i].EstadoAdv).split    		# Checa o match dos estados
			
			@AdvogadosDisponiveis[@NumAdv] = advogados[i]
			@NumAdv += 1										   					# Contador de advogados
			@verificador = 1														# Verificador se houve ao menos um Match
		end		
	end	
	

	puts "\n\n"

	if @verificador == 0
		puts "Desculpe, não possuímos nenhum advogado cadastrado no seu estado, Sr(a) " + cliente.NomeCliente
	else 

		for j in 0..estados.length-1

			if @AdvogadosDisponiveis[0].EstadoAdv == estados[j].NomeEstado
				save = j
				break
			end	 
		end

		@AdvogadoIdeal = IdealLawyer(@AdvogadosDisponiveis,estados,save)
		estados[save].Interacao = ((estados[save].Interacao).to_i + 1).to_s
		
		puts "Verificamos e encontramos o profissional ideal para o seu caso, senhor(a) " + cliente.NomeCliente
		puts "\n"
		puts "Seu advogado ideal é o(a) Dr.(a) " + (@AdvogadoIdeal).to_s
	end
end

def IdealLawyer(adv,estados,save)
 
	for i in 0..adv.length-1

		if  (estados[save].Interacao).to_i > adv.length

			estados[save].Interacao = "1"
		end	

		if adv[i].Ordem == estados[save].Interacao
			return adv[i].NomeAdv
			break
		end	
	end
end	


# Banco de dados dos advogados e estados cadastrados

ce = Estado.new("CE","1")
rj = Estado.new("RJ","1")
sp = Estado.new("SP","1")
rs = Estado.new("RS","1")
pe = Estado.new("PE","1")

estados = [ce,rj,sp,rs,pe]

adv0 = Advogado.new("Yasmin Corrêa","CE","1")					
adv1 = Advogado.new("Arthur Melo","SP","1")
adv2 = Advogado.new("Jesus Fernandéz","PE","1")
adv3 = Advogado.new("Bruno Sampaio","CE","2")
adv4 = Advogado.new("Daiana Monteiro","RJ","1")											
adv5 = Advogado.new("Sabrina Sá","RS","1")
adv6 = Advogado.new("Maria Luiza","PE","2")
adv7 = Advogado.new("João Paulo Carneiro","RS","2")
adv8 = Advogado.new("Saulo Rodrigues","SP","2")
adv9 = Advogado.new("Ana Paula de Carvalho","RJ","2")

advogados = [adv0, adv1, adv2, adv3, adv4, adv5, adv6, adv7, adv8, adv9]



# Cadastro de 2 clientes para passar pelo "Match"

cliente0 = CadastroDeClientes() 
puts "\n\n"											
cliente1 = CadastroDeClientes() 											

clientes = [cliente0,cliente1]



# Testando os matches:

Match(clientes[0],advogados,estados)
puts "\n\n\n\n"
Match(clientes[1],advogados,estados)