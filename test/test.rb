require "minitest/autorun"
require "lib/hola.rb"

class TestHola < Minitest::Test

	def setup
    	@ho = HLClass.new
  	end


  	def test_hi

  		assert_nequal "OHAI!", HLClass.hi

  	end



  	def test_p
  		wont_match "p", @ho.passtest
  	end

  end


