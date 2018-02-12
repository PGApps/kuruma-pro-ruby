module KurumaPro
  module API
    module Order
      def get_orders(params)
        shop_id = params.delete :shop_id
        request(:get, "/shops/#{shop_id}/orders", params)
      end

      def get_order(shop_id, order_id)
        request(:get, "/shops/#{shop_id}/orders/#{order_id}", {})
      end

      def cancel_order(shop_id, order_id, params)
        request(:post, "/shops/#{shop_id}/orders/#{order_id}/cancel", params)
      end

      def cancel_sub_order_detail(shop_id, sub_order_detail_id, params)
        request(:post, "/shops/#{shop_id}/sub_order_details/#{sub_order_detail_id}/cancel", params)
      end

      def deliveried_sub_order_delivery(shop_id, sub_order_delivery_id, params)
        request(:post, "/shops/#{shop_id}/sub_order_deliveries/#{sub_order_delivery_id}/deliveried", params)
      end
    end
  end
end
