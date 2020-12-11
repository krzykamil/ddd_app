platform = Platform.create(name: "Arkency")
company = Company.create(name: "2NIT", platform: platform)
sp = SalesPerson.create(name: "MyGuy")
Agreement.create(owner: sp, company: company, percentage: 5.5, status: "signed")
Agreement.create(owner: platform, company: company, percentage: 1.5, status: "signed")
CompanySalesPerson.create(company: company, sales_person: sp)
prods = []
(1..10).each do |i|
  prods << {
    name: "Product#{i}",
    quantity: i +5,
    price: rand(100),
    company_id: company.id
  }
  prods
end
Products::Product.insert_all(prods)
