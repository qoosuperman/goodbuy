class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:feedback]

  def feedback 
    permitted = params.permit("CustomField1", "CustomField2", "CustomField3", "CustomField4", "MerchantID", "MerchantTradeNo", "PaymentDate", "PaymentType", "PaymentTypeChargeFee", "RtnCode", "RtnMsg", "SimulatePaid", "StoreID", "TradeAmt", "TradeDate", "TradeNo", "CheckMacValue" )
    attributes = permitted.to_h || {}


    check_mac_value = attributes["CheckMacValue"]
    attributes.delete("CheckMacValue")
    chk_value = attributes
    real_mac_value = Ecpay::Invoice::CreateMacValue.new(attributes).run

    if real_mac_value = check_mac_value
      render plain: "1|OK", status: 200 
    else
      render plain: "NG", status: 400 
    end
  end
end
