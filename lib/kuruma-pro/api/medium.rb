module KurumaPro
  module API
    module Medium
      def upload_medium(params)
        shop_id = params.delete :shop_id
        request(
          :post,
          "/shops/#{shop_id}/media",
          params[:medium_data],
          {
            'Content-Type': 'application/octet-stream',
            'x-kuruma-api-body': {medium_type: params[:medium_type]}.to_json,
          }
        )
      end
    end
  end
end
