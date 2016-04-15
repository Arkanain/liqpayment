class LiqpayRequestsController < ApplicationController
  protect_from_forgery except: :liqpay_payment

  def index
    @liqpay_requests = LiqpayRequest.all
  end

  def new
    @liqpay_request = LiqpayRequest.new(
      amount: '1',
      description: 'Technic'
    )
  end

  def create
    @liqpay_request = LiqpayRequest.create(params[:liqpay_request])

    liqpay = Liqpay.new
    request = liqpay.api('invoice/send', {
                                         sandbox: 1,
                                         email: 'test@example.com',
                                         currency: 'UAH',
                                         amount: @liqpay_request.amount.to_i,
                                         order_id: [*0..9].sample(200).join.to_i,
                                         server_url: liqpay_payment_url,
                                         result_url: liqpay_request_url(@liqpay_request),
                                         goods: [{
                                                   amount: 1,
                                                   count: 1,
                                                   unit: 'pcs',
                                                   name: 'Order'
                                                 }]
                                       })

    redirect_to request['href']
  end

  def show
    @liqpay_request = LiqpayRequest.find(params[:id])
  end

  def liqpay_payment
    puts

    # data[:status] -> success
  end
end