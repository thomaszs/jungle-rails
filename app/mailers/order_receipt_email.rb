class OrderReceiptEmail < ApplicationMailer
  default from: "no-reply@jungle.com"

  def receipt_email(params)
    @email = params[:email]
    @order = params[:order]
    @line_items = @order.line_items.all

    mail(to: @email, subject: @order.id)
  end
end
