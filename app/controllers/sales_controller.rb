class SalesController < ApplicationController

  def new
    @sale = Sales::Sale.new
    render :new
  end

  def create
    sale = Sales::Sale.create(
      quantity: params[:sales_sale][:quantity],
      product_id: params[:product_id][:product_id],
      sales_person_id: SalesPerson.find_by(name: "MyGuy").id, #mock of current user etc
      company_id: Products::Product.find(params[:product_id][:product_id]).company.id
    )
    Rails.configuration.command_bus.(
      Sales::MakeSale.new(
        sale_id: sale.id,
        quantity: sale.quantity,
        product_id: sale.product_id
      )
    )
    head :ok
  end
end
