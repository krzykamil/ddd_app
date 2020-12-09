Company.new(name: "2NIT").save
SalesPerson.new(name: "MyGuy").save
Platform.new(name: "Arkency").save
Agreement.new(owner_id: SalesPerson.find_by(name: "MyGuy").id, owner_type: "sales_person", company_id: Company.find_by(name: "2NIT"), percentage: 5.5, status: "signed").save
Agreement.new(owner_id: Platform.find_by(name: "Arkency").id, owner_type: "platform", company_id: Company.find_by(name: "2NIT"), percentage: 5.5, status: "signed").save
CompanySalesPerson.new(company: Company.find_by(name: "2NIT"), sales_person: SalesPerson.find_by(name: "MyGuy")).save
prods = []
(1..10).each do |i|
  prods << { name: "Product#{i}",
             quantity: i +5,
                         price: rand(100),
                         company_id: Company.first.id
  }
  prods
end
Products::Product.insert_all(prods)
