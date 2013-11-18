require "fraccion.rb"
#QUITAR LOS TO_F DE LAS OPERACIONES Y HACER UN COERCE!!!!!!!!!!!
class Matriz
attr_accessor :fil, :col
include Comparable

	def initialize(f, c)
		#atributo
	    	@fil=f.to_i; #Numero de filas
	    	@col=c.to_i; #Numero de columnas
	end


	#Sobrecarga del operador de suma, recibe como parametros dos matrices y devuelve una matriz con el resultado de la suma de 		forma A+B= (Aij+Bij)
	def +(other)	             
		if(self.fil == other.fil and self.col == other.col)
			# SELF Matrices densas
			if self.instance_of?MatrizDensa
				temp = MatrizDensa.new(self.fil, self.col, nil)
				if other.instance_of?MatrizDensa
					
					for i in (0...@fil.to_i)
						for j in (0...@col.to_i)
							temp.mat[i][j] = (self.mat[i][j]) + (other.mat[i][j])
						end
					end
				end

				if other.instance_of?MatrizDispersa
					for i in (0...@fil.to_i)
						for j in (0...@col.to_i)
							encontrado = 0
							for k in (0...other.posx.size)
								if (i==other.posx[k] and j==other.posy[k] and encontrado==0)
									temp.mat[i][j] = (self.mat[i][j]) + (other.valor[k])
									encontrado = 1	
								end
							end
							if (encontrado == 0)
								temp.mat[i][j] = self.mat[i][j]
							end
						end
					end
				end
			end

			# SELF Matriz Dispersa
			if self.instance_of?MatrizDispersa

				if other.instance_of?MatrizDensa
					temp = MatrizDensa.new(self.fil, self.col, nil)
					for i in (0...@fil.to_i)
						for j in (0...@col.to_i)
							encontrado = 0
							for k in (0...self.posx.size.to_i)
								if (i==self.posx[k] and j==self.posy[k] and encontrado==0)
									temp.mat[i][j] = (other.mat[i][j]) + (self.valor[k])
									encontrado = 1	
								end
							end
							if (encontrado == 0)
								temp.mat[i][j] = other.mat[i][j]
							end
						end
					end
				end
		

				if other.instance_of?MatrizDispersa
					temp = MatrizDispersa.new(self.fil,self.col,[],[],[])

					for j in (0...other.posx.size.to_i)
						for k in (0...other.posx.size.to_i)
							if(other.posx[j] == self.posx[k] and other.posy[j] == self.posy[k])
								temp.valor << self.valor[j] + other.valor[k]
								temp.posx << self.posx[k]
								temp.posy << self.posy[k]
							end
						end
						if (encontrado == false)
							temp.posx << other.posx[j]
							temp.posy << other.posy[j]
							temp.valor << other.valor[j]
						end
					end
				end
			end
		
			return temp
		else 
			return nil
		end
	end
	    
end


class MatrizDensa < Matriz
attr_accessor :mat
	def initialize(f,c,e)
		super(f,c)
		@mat = Array.new(@fil.to_i){Array.new(@col.to_i)}

	    	if (e != nil)
			#Rellenamos la matriz con lo valores recibidos 
	    		for i in (0...@fil.to_i)
				for j in (0...@col.to_i)
					@mat[i][j]=e[i*@col.to_i+j];
				end
	    		end
	    	end
	end
	# Metodos getter devuelve el valor de una posicion determinada

	def pos(a,b)
		@mat[a][b]
	end
	
	#Metodo que devuelve la matriz en forma de string                       
	def to_s    
		"#{@mat}"
	end

	                             
#Operador de comparacion (Modulo comparable). se comparan por la suma de sus componentes PONERLO EN LA CLASE MADRE!!!!!!
=begin
	def <=> (other)
		return nil unless other.is_a?MatrizDensa
		c1=0
		c2=0
		for i in (0...@fil.to_i)
			for j in (0...@col.to_i)
				if(self.mat[i][j] > other.mat[i][j])
					c1++
				elsif(self.mat[i][j] < other.mat[i][j])
					c2++
				end
			end
		end
		(c1)<=>(c2)
	end
=end

end
		



class MatrizDispersa < Matriz
attr_accessor :posx, :posy, :valor
	def initialize(f,c,posx, posy, valor)
		super(f,c)
		@posx = posx
		@posy = posy
		@valor = valor

	end

	def to_s
		for i in (0...@fil.to_i)
			for j in (0...@col.to_i)
				#CODE GOES HERE
			end
		end
	end
end


=begin
a=MatrizDensa.new(3,3,[1,2,3,4,5,6,7,8,9])
b=MatrizDensa.new(3,3,[1,2,3,4,5,6,7,8,9])
puts "#{(a+b).to_s}"
puts "#{(a-b).to_s}"
puts "#{(a*b).to_s}"


a=MatrizDensa.new(3,3,[1,2,3,4,5,6,7,8,9])
b=MatrizDispersa.new(3,3,[0,1,2],[0,1,2],[1,2,3])
b=(b+b)
puts "#{(b.valor).to_s}"

c=MatrizDensa.new(2,2,[Fraccion.new(1,2),Fraccion.new(1,4),Fraccion.new(3,2),Fraccion.new(8,7)])
d=MatrizDensa.new(2,2,[1,2,3,4])

puts "#{(c+d).to_s}"
=end

a=MatrizDensa.new(3,3,[1,2,3,4,5,6,7,8,9])
b=MatrizDispersa.new(3,3,[0,1,2],[0,1,2],[1,2,3])
puts "#{(a+b).to_s}"
puts "#{(b+a).to_s}"
