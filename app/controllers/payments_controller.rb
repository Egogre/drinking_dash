class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new
    attributes = params[:payment]
    @payment.card_type = attributes[:card_type]
    @payment.credit_card_number = attributes[:credit_card_number]
    @payment.expiration_date = Payment.format_expiration_date(attributes["expiration_date(2i)"],
							      attributes["expiration_date(1i)"])
    @payment.user_id = current_user.id
    @payment.save!
    if current_order.present?
      redirect_to order_path(current_order)
    else
      redirect_to user_path(current_user)
    end
  end

end
