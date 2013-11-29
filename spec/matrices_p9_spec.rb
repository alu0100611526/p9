require 'matrices_p9' 

#expectativas para la clase Matriz y sus clase hijas ( Densas y Dispersas) 
describe Matriz do
	before :each do	
		#Matrices densas
		@m1 = MatrizDensa.new(3,3,[1,2,3,4,5,6,7,8,9])
		@m2 = MatrizDensa.new(3,3,[1,2,3,4,5,6,7,8,9])
		@mm1 = MatrizDensa.new(2,2,[1,1,1,1])
		
		#Matrices dispersas
		@m3 = MatrizDispersa.new(3,3,[0,1,2],[0,1,2],[1,2,3])
		@m4 = MatrizDispersa.new(3,3,[0,1,2],[0,1,2],[1,2,3])
		@mm2 = MatrizDispersa.new(2,2,[0],[0],[Fraccion.new(1,2)])
		
		#Matrices densas con fracciones
		@m5 = MatrizDensa.new(2,2,[Fraccion.new(1,2),Fraccion.new(1,3),Fraccion.new(1,4),Fraccion.new(1,5)])
		@m6 = MatrizDensa.new(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])
	end

#Initialize
	describe "#Inicializar la matriz" do
		it "Se usa pos para acceder a los elementos" do
			@m1.pos(0,2).should eq(3)
			@m1.pos(2,2).should eq(9)
			@m2.pos(2,1).should eq(8) 
		end
	end
=begin
#Operaciones básicas	
	describe "#Operaciones elementales" do

		it "Se invoca a to_s" do 
			@m1.to_s.should eq("[[1, 2, 3], [4, 5, 6], [7, 8, 9]]")
		end

		it "Se invoca a suma" do 
			
			(@m1+@m2).to_s().should eq("[[2, 4, 6], [8, 10, 12], [14, 16, 18]]")
		end
		
		it "Se invoca a resta" do 
			(@m1-@m2).to_s().should eq("[[0, 0, 0], [0, 0, 0], [0, 0, 0]]")
		end

		it "Se invoca a multiplicacion" do 
			(@m1*@m2).to_s().should eq("[[30, 36, 42], [66, 81, 96], [102, 126, 150]]")
		end

		it "Suma de elementos" do 
			@m1.suma().should eq(45)
		end
		
	end

#Comparaciones
	describe "#Operadores de comparacion" do
		it "Mayor que" do
			(@m1>@m2).should eq(false)
		end

		it "Menor que" do
			(@m1<@m2).should eq(false)
		end

		it "Mayor igual que" do
			(@m1>=@m2).should eq(true)
		end
		
		it "Menor igual que" do
			(@m1<=@m2).should eq(true)
		end

		it "Igual que" do
			(@m1==@m2).should eq(true)
		end

		it "Distinto de" do
			(@m1!=@m2).should eq(false)
		end
	end
=end
#Modificacion
	describe "#Operadores de comparacion" do
		it "Suma fracciones" do
			(@m5+@m6).to_s.should eq("[[1/1, 1/1], [1/1, 1/1]]")
		end

=begin		it "Multiplicacion de fracciones" do
			(@m5*@m6).to_s.should eq("[[1/2, 3/5], [11/40, 49/150]]")
		end
=end
	end

#creacion de matrices dispersas
	describe "#creando una matriz dispersa" do
		it "Comprobando que se creo correctamente." do
			@m3.pos(0,0).should eq(1)
			@m3.pos(1,1).should eq(2)
			@m3.pos(2,2).should eq(3)
		end
	end



#Prueba de matrices densas y dispersas. 
	describe "#Operaciones de suma entre matrices densas y dispersas." do
		it "Suma de matrices dispersas" do
			(@m3+@m4).to_s().should eq("[[0,0,2][1,1,4][2,2,6]]")
		end		
		
		it "Suma de matrices densas y dispersas" do
			(@m1+@m3).to_s().should eq("[[2, 2, 3], [4, 7, 6], [7, 8, 12]]")
		end
		
		it "Suma de matrices dispersas y densas " do
			(@m3+@m1).to_s().should eq("[[2, 2, 3], [4, 7, 6], [7, 8, 12]]")
		end
		
	end
#Prueba de modificacion 

	describe "#Operaciones de suma entre matrices densas y dispersas con fracciones." do
	
		it "Suma" do
			(@mm1+@mm2).to_s().should eq("[[3/2, 1], [1, 1]]")
			
		end		
		
		
	end
		
	describe "#Usando bloques" do
	
		it "Devuelve la posicion del valor que cumple la condicion" do
			@m1.encontrar{|e| e*e >= 16}.should eq([1,0])
			
		end		
		
		
	end	
	
	
	
	
end
