require("pry")
require("../models/merchant.rb")
require("../models/tag.rb")
require("../models/transaction.rb")


Merchant.delete_all()
Tag.delete_all()
Transaction.delete_all


merchant1 = Merchant.new({'name'=>'Zara')
merchant2 = Merchant.new({'name'=>'Tesco')
merchant3 = Merchant.new({'name'=>'Morrison')
merchant4 = Merchant.new({'name'=>'Fusion')

merchant1.save()
merchant2.save()
merchant3.save()
merchant4.save()

tag1= Tag.new({'type_of_buy'=>'Clothing')
tag2= Tag.new({'type_of_buy'=>'Groceries')
tag3= Tag.new({'type_of_buy'=>'Cleaning products')
tag4= Tag.new({'type_of_buy'=>'Meal out')

tag1.save()
tag2.save()
tag3.save()
tag4.save()
