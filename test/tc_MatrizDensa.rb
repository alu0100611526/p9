
require 'fraccion'
require 'matrices_p9'
require "test/unit"

# Pruebas unitarias de la clase matriz densa
class Test_MatrizDensa < Test::Unit::TestCase
	#prueba para suma de matrices densas 
	def test_1
	
		assert_equal "[[2, 4, 6], [8, 10, 12], [14, 16, 18]]", (MatrizDensa.new(3,3,[1,2,3,4,5,6,7,8,9]) + MatrizDensa.new(3,3,[1,2,3,4,5,6,7,8,9])).to_s	
		#assert_equal "[[0, 0, 0], [0, 0, 0], [0, 0, 0]]", (MatrizDensa.new(3,3,[1,2,3,4,5,6,7,8,9]) - MatrizDensa.new(3,3,[1,2,3,4,5,6,7,8,9])).to_s
		#assert_equal "[[30, 36, 42], [66, 81, 96], [102, 126, 150]]", (MatrizDensa.new(3,3,[1,2,3,4,5,6,7,8,9])* MatrizDensa.new(3,3,[1,2,3,4,5,6,7,8,9])).to_s
		
	end
	
	#pruebas con matrices de fracciones
	def test2
		assert_equal "[[1/1, 1/1], [1/1, 1/1]]", (MatrizDensa.new(2,2,[Fraccion.new(1,2),Fraccion.new(1,3),Fraccion.new(1,4),Fraccion.new(1,5)]) + MatrizDensa.new(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])).to_s	
		#assert_equal "[[1/2, 3/5], [11/40, 49/150]]", (MatrizDensa.new(2,2,[Fraccion.new(1,2),Fraccion.new(1,3),Fraccion.new(1,4),Fraccion.new(1,5)]) * MatrizDensa.new(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])).to_s	
		
	end
	

end
