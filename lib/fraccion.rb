
#require "./gcd.rb"
#Programa que trabaja con fracciones
#Adriana Rolo Inchausti, Luis Antonio Orta Mendes 

class Fraccion
attr_reader :denominador, :numerador

	def initialize(num, denomin)
		#atributo
		mcd=gcd(num,denomin)

			@numerador=num/mcd
			@denominador=denomin/mcd
	end
	
	#Maximo comun divisor, funcion usada para simplificar las matrices.
	def gcd(u, v)
  		u, v = u.abs, v.abs
  		while v != 0
    			u, v = v, u % v
  		end
  		u
	end
	

# Metodos getter de Numerador y denominador

	def num
		return @numerador
	end


	def denom
		return @denominador
	end 

#Metodo que devuelve la fraccion en forma de string de la manera a/b
	def to_s
                "#{@numerador}/#{@denominador}"
        end
        
#Metodo que devuelve el numero decimal que representa la matriz 
	def to_f 
		a=@numerador.to_f
		b=@denominador.to_f
		a/b
	end
#Sobrecarga del operador de comparacion, devuelve true si son iguale  y false en caso contrario
	def == (otro)
		if (@numerador==otro.numerador) && (@denominador == otro.denominador)
			return true
		else 
			return false
		end
	end 

#Metodo para calcular el valor absoluto de la fraccion (numerador y denominador positivo) 
	def abs
		if @numerador < 0
			@numerador = @numerador*-1
		end
		if @denominador < 0
			@denominador = @denominador*-1
		end
		return self
	end

#Metodo que devuelve la matriz invertida de la forma que si al comienzo era a/b, devolveria b/a
	def reciprocal
		aux= @numerador 
		@numerador =  @denominador
		@denominador = aux
	end

#Metodo que devuelve la fraccion con el signo contrario al que tenia incialmente
	def opuesto
		@numerador = -1*@numerador
		return self
	end

#Calcula el Minimo comun multiplo, se usa para realizar la suma y la resta 
	def mcm(a,b)
		(a*b)/gcd(a,b)
    	end
#Sobrecarga del operador de suma, recibe como parametros dos fracciones y devuelve una fraccion con el resultado de la suma
	def +(other)
		if(other.instance_of?Fixnum)
			temp=other
			other=Fraccion.new(temp,1)
		end
		if (@denominador ==  other.denominador)
			nume=@numerador + other.numerador
			deno=@denominador
			mcd=gcd(nume,deno)
		else
			aux= @denominador * other.denominador
			nume = ((aux / @denominador) * @numerador) + ((aux / other.denominador) * other.numerador)
			deno = @denominador*other.denominador
			mcd=gcd(nume,deno)
		end
		
		temp = Fraccion.new(nume/mcd, deno/mcd)
	end


#Sobrecarga del operador de resta, recibe como parametros dos francciones y devuelve una fraccion con el resultado de la resta
	def -(other)
		if(other.instance_of?Fixnum)
			temp=other
			other=Fraccion.new(temp,1)
		end
		if (@denominador ==  other.denominador )
			nume=@numerador - other.numerador
			deno=@denominador
			mcd=gcd(nume,deno)
		
		else
			aux= @denominador * other.denominador
			nume = ((aux / @denominador) * @numerador) - ((aux / other.denominador ) * other.numerador)
			deno=@denominador*other.denominador
			mcd=gcd(nume,deno)
		
		end
		
		
		temp = Fraccion.new(nume/mcd, deno/mcd)
	end

#Sobrecarga del operador de multiplicación, recibe como parametros dos francciones y devuelve una fraccion con el resultado de la multiplicación
	def * (other) 
		nume = @numerador * other.numerador
		deno = @denominador * other.denominador
		mcd=gcd(nume,deno)
		temp = Fraccion.new(nume / mcd ,deno / mcd )
	
	end	

#Sobrecarga del operador de division, recibe como parametros dos francciones y devuelve una fraccion con el resultado de la division
	def / (other)
	
		nume = @numerador *other.denominador
		deno = @denominador * other.numerador
		mcd= gcd(nume,deno)
		temp = Fraccion.new(nume/mcd, deno/mcd )
	
	end

#Sobrecarga del operador de modulo, recibe como parametros dos francciones y devuelve el resto de la division de las mismas 
	def % (other)
		aux=Fraccion.new(1,1)
        	aux=self/other
		aux.numerador%aux.denominador
	end


#Sobrecarga de operadores de comparación devuelve true en caso de que sea cierto y falso en caso contrario 
#Mayor que 
	def > (otro)
		if (@numerador/@denominador > otro.numerador/otro.denominador)
			return true
		else
			return false
		end
		
	end
	
#menor que 	
	def < (otro)
		if (@numerador/@denominador < otro.numerador/otro.denominador)
			return true
		else
			return false
		end
		
	end
#mayor igual que 
	def >= (otro)
		if (@numerador/@denominador >= otro.numerador/otro.denominador)
			return true
		else
			return false
		end
		
	end
#menos igual que 
	def <= (otro)
		if (@numerador/@denominador <= otro.numerador/otro.denominador)
			return true
		else
			return false
		end
		
	end
#Coerce
	def coerce(other)
		[self, other]
	end
end




























