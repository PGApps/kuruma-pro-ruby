module KurumaPro
  module API
    module Item
      def get_items(params)
        shop_id = params.delete :shop_id
        request(:get, "/shops/#{shop_id}/items", params)
      end

      def get_item(shop_id, item_id)
        request(:get, "/shops/#{shop_id}/items/#{item_id}", {})
      end

      def store_item(params)
        shop_id = params.delete :shop_id
        request(:post, "/shops/#{shop_id}/items", params)
      end

      def restore_item(params)
        shop_id = params.delete :shop_id
        item_id = params.delete :item_id
        request(:put, "/shops/#{shop_id}/items/#{item_id}", params)
      end

      def unpublish_item(shop_id, item_id)
        request(:put, "/shops/#{shop_id}/items/#{item_id}/unpublish", {})
      end

      def publish_item(shop_id, item_id)
        request(:put, "/shops/#{shop_id}/items/#{item_id}/publish", {})
      end

      def update_item_stock(shop_id, item_id, new_stock)
        request(:put, "/shops/#{shop_id}/items/#{item_id}/stock", {stock: new_stock})
      end
    end
  end
end
