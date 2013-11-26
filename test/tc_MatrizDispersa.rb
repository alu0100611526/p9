require "fraccion"
require "matrices_p9"
require "test/unit"

# Pruebas unitarias de la clase matriz dispersa
class Test_MatrizDispersa < Test::Unit::TestCase
	#Prueba con matrices dispersas
	def test_1
	
		assert_equal "[[0,0,2][1,1,4][2,2,6]]", (MatrizDispersa.new(3,3,[0,1,2],[0,1,2],[1,2,3]) + MatrizDispersa.new(3,3,[0,1,2],[0,1,2],[1,2,3])).to_s	
		
	end

end

