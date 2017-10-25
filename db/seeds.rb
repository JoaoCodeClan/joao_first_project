require("pry")
require_relative("../models/merchant.rb")
require_relative("../models/tag.rb")
require_relative("../models/transaction.rb")
require_relative('../models/budget.rb')

Transaction.delete_all
Merchant.delete_all()
Tag.delete_all()
Budget.delete_all()

budget1 = Budget.new({'budget'=> 1000, 'month'=> 'November'})
budget1.save()

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

transaction1 = Transaction.new({'amount'=> '100', 'date_of_transaction'=> '20/03/2017','merchant_id'=> merchant1.id, 'tag_id'=> tag1.id, 'budget_id'=> budget1.id })
transaction2 = Transaction.new({'amount'=> '50', 'date_of_transaction'=> '23/02/2017','merchant_id'=> merchant2.id, 'tag_id'=> tag1.id, 'budget_id'=> budget1.id })
transaction3 = Transaction.new({'amount'=> '20', 'date_of_transaction'=> '23/02/2017','merchant_id'=> merchant3.id, 'tag_id'=> tag3.id, 'budget_id'=> budget1.id })
transaction4 = Transaction.new({'amount'=> '40', 'date_of_transaction'=> '24/01/2017','merchant_id'=> merchant4.id, 'tag_id'=> tag4.id , 'budget_id'=> budget1.id})

transaction1.save()
transaction2.save()
transaction3.save()
transaction4.save()



binding.pry


nil
