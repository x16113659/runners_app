class StaticPagesController < ApplicationController

  def home
    @categories = Category.all
  end

  def help
  end

  def category
    st = params[:title]
    @items = Item.where("category like ?" , st)
  end

  def orderConfirmed
  end
  
  
  def paid
    flash[:notice] = 'Transaction Complete'
    @order = Order.last

    #"Paid by User:#{current_user.id} #{current_user.name} #{current_user.surname}")
    @order.update_attribute(:status , "Paid by User: #{current_user.email}")

    # Here you could also clear the cart
    session[:cart] = nil
  end  
  
    
end
