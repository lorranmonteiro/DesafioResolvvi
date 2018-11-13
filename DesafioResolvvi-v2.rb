# Desafio Resolvvi - Lorran Monteiro

class Advogado
	attr_reader :NomeAdv, :EstadoAdv

	def initialize(nome,estado)
		@NomeAdv = nome
		@EstadoAdv = estado
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

	puts "Digite a sigla do seu estado conforme o exemplo: ce  sp  rj mg"
	estado = gets

	return Cliente.new(nome,estado)
end

def Match(cliente,advogados)

	@verificador = 0
	@NumAdv = 0
	@AdvogadosDisponiveis = []
																					
	for i in 0..9   																# Checa todos os advogados cadastrados
		if (cliente.EstadoCliente).split == (advogados[i].EstadoAdv).split    		# Checa o match dos estados
			
			@AdvogadosDisponiveis[@NumAdv] = advogados[i].NomeAdv
			@NumAdv += 1										   					# Contador de advogados
			@verificador = 1														# Verificador se houve ao menos um Match

		end		
    end	
	

	puts "\n\n"

	if @verificador == 0
		puts "Desculpe, não possuímos nenhum advogado cadastrado no seu estado."
	else 
		
		@AdvogadoIdeal = IdealLawyer(@AdvogadosDisponiveis)
		puts "Verificamos e encontramos o profissional ideal para o seu caso, senhor(a) " + cliente.NomeCliente
		puts "\n"
		puts "Seu advogado ideal é o(a) Dr.(a) " + (@AdvogadoIdeal).to_s

	end
end

def IdealLawyer(adv)

	@AdvogadoIdeal = adv.sample						# Método aleatório de escolha dentre os advogados de cada estado

	return @AdvogadoIdeal                            					# Não justo! (Procurar outro método)
end	


# Banco de dados dos advogados cadastrados

adv0 = Advogado.new("Yasmin Corrêa","ce")					
adv1 = Advogado.new("Arthur Melo", "sp")
adv2 = Advogado.new("Jesus Fernandéz", "pe")
adv3 = Advogado.new("Bruno Sampaio","ce")
adv4 = Advogado.new("Daiana Monteiro", "rj")											
adv5 = Advogado.new("Sabrina Sá", "rs")
adv6 = Advogado.new("Maria Luiza", "pe")
adv7 = Advogado.new("João Paulo Carneiro", "rs")
adv8 = Advogado.new("Saulo Rodrigues", "sp")
adv9 = Advogado.new("Ana Paula de Carvalho", "rj")

advogados = [adv0, adv1, adv2, adv3, adv4, adv5, adv6, adv7, adv8, adv9]



# Cadastro de 2 clientes para passar pelo "Match"

cliente0 = CadastroDeClientes() 
puts "\n\n"											
cliente1 = CadastroDeClientes() 
											

clientes = [cliente0,cliente1]



# Testando os matches:

Match(clientes[0],advogados)
puts "\n\n\n\n"
Match(clientes[1],advogados)