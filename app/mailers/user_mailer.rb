class UserMailer < ActionMailer::Base
  default from: "\"Bestnid\" <bestnid.cloud.9@gmail.com>",
  		  charset: "UTF-8"

  def bid_accepted_seller_email(accepted_bid)
  	set_variables(accepted_bid)

    mail(to: @seller.email,
    	 subject: "Felicidades! Has vendido tu producto '" + @product.title + "'")
  end

  def bid_accepted_buyer_email(accepted_bid)
  	set_variables(accepted_bid)

  	mail(to: @buyer.email,
    	 subject: "Felicidades! Has comprado el producto '" + @product.title + "'")
  end

  private

  def set_variables(accepted_bid)
  	@bid = accepted_bid
  	@buyer = accepted_bid.user
  	@seller = accepted_bid.product.user
  	@product = accepted_bid.product
  end

end