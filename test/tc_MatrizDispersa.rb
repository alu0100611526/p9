# Pruebas unitarias de la clase matriz densa

require "./lib/fraccion.rb"
require "./lib/matrices_p9.rb"

require "test/unit"


class Test_MatrizDispersa < Test::Unit::TestCase
	
	def test_1
	
		assert_equal "[[2, 0, 0], [0, 4, 0], [0, 0, 6]]", (MatrizDispersa.new(3,3,[0,1,2],[0,1,2],[1,2,3]) + MatrizDispersa.new(3,3,[0,1,2],[0,1,2],[1,2,3])).to_s	
		
	end

end
