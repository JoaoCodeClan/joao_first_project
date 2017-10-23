require("minitest/autorun")
require("minitest/rg")
require_relative("../models/merchant.rb")

class TestMerchant < MiniTest::Test

def setup
@merchant1 = Merchant.new('Zara')
end


 def test_merchant_has_a_name
   result = @merchant1.name
 assert_equal('Zara',result)
 end


end
