require "matrices_p9/version"
require "fraccion.rb"

#Clase abstracta de la que heredan matriz densa y dispersa. No se puede crear un objeto de esta clase.
class Matriz

#Modulo para comparar
include Comparable

#Numero de filas
attr_accessor :fil 

#Numero de columnas 
attr_accessor :col
	#Se almacena el valor de las filas y las columnas segun se le pasen por parametros. 
	def initialize(f, c)
	    	@fil=f.to_i; 	    	
	    	@col=c.to_i; 
	end


	#Sobrecarga del operador de suma, recibe como parametros dos matrices y devuelve una matriz con el resultado de la suma de 		forma A+B= (Aij+Bij)
	def +(other)	             
		if(self.fil == other.fil and self.col == other.col)
			# SELF Matrices densas
			if self.instance_of?MatrizDensa
				temp = MatrizDensa.new(self.fil, self.col, nil)
				if other.instance_of?MatrizDensa
					
					#for i in (0...@fil.to_i)
					@fil.to_i.times do |i| 
					
						#for j in (0...@col.to_i)
						@col.to_i.times do |j|
							temp.mat[i][j] = (@mat[i][j]) + (other.mat[i][j])
							
						end
					end
				end

				if other.instance_of?MatrizDispersa
					#for i in (0...@fil.to_i)
					@fil.to_i.times do |i| 
					
						#for j in (0...@col.to_i)
						@col.to_i.times do |j| 
					
							encontrado = 0
							#for k in (0...other.posx.size)
							other.posx.size.times do |k| 
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
					#for i in (0...@fil.to_i)
						@fil.to_i.times do |i| 
					
						for j in (0...@col.to_i)
							encontrado = 0
							#for k in (0...self.posx.size.to_i)
							self.posx.size.times do |k| 
							
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
					temp.valor = self.valor
					temp.posx = self.posx
					temp.posy = self.posy

					#for j in (0...other.posx.size.to_i)
					other.posx.size.to_i.times do |j| 
					
						encontrado = false
						#for k in (0...self.posx.size.to_i)
						self.posx.size.times do |k| 
							
							if(other.posx[j] == temp.posx[k] and other.posy[j] == temp.posy[k])
								temp.valor[k] = temp.valor[k] + other.valor[j]
								encontrado = true
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
	#Sobrecarga del operador de resta, recibe como parametros dos matrices y devuelve una matriz con el resultado de la suma de forma A-B= (Aij+Bij)
	
	def -(other)	             
		if(self.fil == other.fil and self.col == other.col)
			# SELF Matrices densas
			if self.instance_of?MatrizDensa
				temp = MatrizDensa.new(self.fil, self.col, nil)
				if other.instance_of?MatrizDensa		
					#for i in (0...@fil.to_i)
					@fil.to_i.times do |i| 
					
						#for j in (0...@col.to_i)
						@col.to_i.times do |j| 
							
							temp.mat[i][j] = (self.mat[i][j]) - (other.mat[i][j])
						end
					end
				end

				if other.instance_of?MatrizDispersa
					#for i in (0...@fil.to_i)
					@fil.to_i.times do |i| 
					
						#for j in (0...@col.to_i)
						@col.to_i.times do |j| 
					
							encontrado = 0
							#for k in (0...other.posx.size)
							other.posx.size.times do |k| 
							
								if (i==other.posx[k] and j==other.posy[k] and encontrado==0)
									temp.mat[i][j] = (self.mat[i][j]) - (other.valor[k])
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
					#for i in (0...@fil.to_i)
					@fil.to_i.times do |i| 
					
						#for j in (0...@col.to_i)
						@col.to_i.times do |j| 
							
							encontrado = 0
							#for k in (0...self.posx.size.to_i)
							self.posx.size.times do |k| 
							
								if (i==self.posx[k] and j==self.posy[k] and encontrado==0)
									temp.mat[i][j] = (other.mat[i][j]) - (self.valor[k])
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
					temp.valor = self.valor
					temp.posx = self.posx
					temp.posy = self.posy

					#for j in (0...other.posx.size.to_i)
					other.posx.size.times do |j| 
							
						encontrado = false
						#for k in (0...self.posx.size.to_i)
						self.posx.size.times do |k| 
							
							if(other.posx[j] == temp.posx[k] and other.posy[j] == temp.posy[k])
								temp.valor[k] = temp.valor[k] - other.valor[j]
								encontrado = true
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

#Clase que hereda de la clase matriz. Almacena matrices densas.
class MatrizDensa < Matriz
#Array bidimensional que representa la matriz
attr_accessor :mat 
	#crea una matriz con n filas, m columnas y almacena los valores que se le pasan por parámetros
	def initialize(f,c,e) 
	
		super(f,c)
		@mat = Array.new(@fil.to_i){Array.new(@col.to_i)} #k2
	    	if (e != nil)
			#Rellenamos la matriz con lo valores recibidos 
	    		for i in (0...@fil.to_i)
				for j in (0...@col.to_i)
					@mat[i][j]=e[i*@col.to_i+j];
				end
	    		end
	    	end
	end
	
	# Metodo getter que devuelve el valor de una posicion determinada
	def pos(a,b)
		@mat[a][b]
	end
	
	#Metodo que devuelve la matriz en forma de string                       
	def to_s    
		"#{@mat}"
	end
	
	#funcion que calcula el mayor valor que se encuentra en la matriz	
	def max
		m = self.mat[0][0]
		for i in (0...@fil.to_i)
			#for j in (0...@col.to_i)
			@col.to_i.times do |j| 
							
				if (self.mat[i][j] > m)
					m = self.mat[i][j]
				end
			end
		end
		return m
	end
	
	#funcion que calcula el menor valor que se encuentra en la matriz
	def min
		m = self.mat[0][0]
		for i in (0...@fil.to_i)
			#for j in (0...@col.to_i)
			@col.to_i.times do |j| 
				if (self.mat[i][j] < m)
					m = self.mat[i][j]
				end
			end
		end
		return m
	end
# Funcion que devuelve la posicion en la que se cumple la condicion especificada al llamarla
	def encontrar	
		@fil.to_i.times do |i| 
			@col.to_i.times do |j| 				
				if yield(mat[i][j]) 
					return [i,j]
				end					
			end
		end
	end

#Operador de comparacion (Modulo comparable). se comparan por la suma de sus componentes.
	def <=> (other)
		return nil unless other.is_a?MatrizDensa
		c1=0
		c2=0
		for i in (0...@fil.to_i)
			for j in (0...@col.to_i)
				if(self.mat[i][j] > other.mat[i][j])
					c1+=1
				elsif(self.mat[i][j] < other.mat[i][j])
					c2+=1
				end
			end
		end
		(c1)<=>(c2)
	end

end
		


#Clase que hereda de la clase Matriz. Almacena matrices dispersas (matrices que la mayoria de sus posiciones son nulas 0)

class MatrizDispersa < Matriz
#Almacena las filas en que se encuentra algun valor
attr_accessor :posx
#Almacena las columnas en que se encuentra algun valor
attr_accessor :posy
#Almacena los valores correspondientes
attr_accessor :valor

# se recibe el valor de filas, columnas, los dos arrays con las posiciones en que hay valores y los valores correspondientes
	def initialize(f,c,posx, posy, valor)
		super(f,c)
		@posx = posx
		@posy = posy
		@valor = valor

	end
	
	#Mdevuelve la matriz en forma de string
	def to_s
		s=String.new
		s << "["
		for i in (0...@fil.to_i)
			s << "[#{posx[i]},#{posy[i]},#{valor[i]}]"
		end
		s << "]"
	end
	
	#devuelve el mayor valor almacenado en la matriz
	def max
		m = self.valor[0]
		for i in (0...self.valor.size.to_i)
				if (self.valor[i]> m)
					m = self.valor[i]
				end
		end
		return m
	end
	
	#devuelve el menor valor almacenado en la matriz
	def min
		m = self.valor[0]
		for i in (0...self.valor.size.to_i)
				if (self.valor[i]< m)
					m = self.valor[i]
				end
		end
		return m
	end
	#Retorna el valor correspondiente a las posiciones que se le pasen como parámetros
	def pos(a,b)
		for i in (0...self.posx.size)
			if(posx[i]==a and posy[i]==b)
				return valor[i]
			end
		end
		return nil
	end

end


#|i,j, mat1,mat2| mat2[i][j] = (mat1[i][j]) + (mat2[i][j]) return mat2
	
	
#	f = Proc.new{|i,j, mat1, mat2| mat2[i][j] = (mat1[i][j]) + (mat2[i][j]) puts "#{mat2[i][j]}"}
#	f.call(1,1,[[1,2],[1,2]],[[1,2],[1,2]])








=begin
a=MatrizDensa.new(3,3,[1,2,3,4,5,6,7,8,9])
b=MatrizDensa.new(3,3,[1,2,3,4,5,6,7,8,9])
puts "#{(a+b).to_s}"
puts "#{(a-b).to_s}"


a=MatrizDensa.new(3,3,[1,2,3,4,5,6,7,8,9])
b=MatrizDispersa.new(3,3,[0,1,2],[0,1,2],[1,2,3])
b=(b+b)
puts "#{(b.valor).to_s}"


a=MatrizDensa.new(3,3,[1,2,3,34,5,6,7,8,9])
b=MatrizDispersa.new(3,3,[0,1,2],[0,1,2],[1,0,3])
puts "#{a.max}"
puts "#{b.max}"
puts "#{a.min}"
puts "#{b.min}"

b=MatrizDispersa.new(3,3,[0,1,2],[0,1,2],[1,2,3])
c=MatrizDispersa.new(3,3,[0,1,2],[0,2,2],[1,2,3])
b=(b+c)
puts "#{b.valor.to_s}"

a=MatrizDensa.new(3,3,[1,2,3,4,5,6,7,8,9])
b=MatrizDensa.new(3,3,[1,2,3,4,5,6,7,8,9])
if(a==b)
	puts "igual"
end
if (a>=b)
	puts "mayor"
end

b=MatrizDispersa.new(3,3,[0,1,2],[0,1,2],[1,2,3])
c=MatrizDispersa.new(3,3,[0,1,2],[0,2,2],[1,2,3])
b=(b+c)
puts "#{b.to_s}"


=end


