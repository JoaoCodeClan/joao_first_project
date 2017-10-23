require("pry")
require_relative("../models/merchant.rb")
require_relative("../models/tag.rb")
require_relative("../models/transaction.rb")

Transaction.delete_all
Merchant.delete_all()
Tag.delete_all()



merchant1 = Merchant.new({'name'=>'Zara'})
merchant2 = Merchant.new({'name'=>'Tesco'})
merchant3 = Merchant.new({'name'=>'Morrison'})
merchant4 = Merchant.new({'name'=>'Fusion'})

merchant1.save()
merchant2.save()
merchant3.save()
merchant4.save()

tag1= Tag.new({'type_of_purchase'=>'Clothing'})
tag2= Tag.new({'type_of_purchase'=>'Groceries'})
tag3= Tag.new({'type_of_purchase'=>'Cleaning products'})
tag4= Tag.new({'type_of_purchase'=>'Meal out'})

tag1.save()
tag2.save()
tag3.save()
tag4.save()

transaction1 = Transaction.new({'amount'=> '100', 'date'=> '20/02/2017','merchant_id'=> merchant1.id, 'tag_id'=> tag1.id })
transaction2 = Transaction.new({'amount'=> '50', 'date'=> '23/02/2017','merchant_id'=> merchant2.id, 'tag_id'=> tag2.id })
transaction3 = Transaction.new({'amount'=> '20', 'date'=> '23/02/2017','merchant_id'=> merchant3.id, 'tag_id'=> tag3.id })
transaction4 = Transaction.new({'amount'=> '40', 'date'=> '24/02/2017','merchant_id'=> merchant4.id, 'tag_id'=> tag4.id })

transaction1.save()
transaction2.save()
transaction3.save()
transaction4.save()



binding.pry


nil
