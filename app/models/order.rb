class Order < ApplicationRecord
    belongs_to :user

    def order_params
        params.require(:order).permit( :date, :user_id, :status)
    end
    
    has_many :orderitems, :dependent => :destroy
end
