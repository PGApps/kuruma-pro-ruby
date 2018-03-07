module KurumaPro
  module API
    module Medium
      def upload_medium(params)
        shop_id = params.delete :shop_id
        header_api_params = {medium_type: params[:medium_type]}
        validate!("media.create.request", header_api_params)
        request(
          :post,
          "/shops/#{shop_id}/media",
          params[:medium_data],
          {
            'Content-Type': 'application/octet-stream',
            'x-kuruma-api-body': header_api_params.to_json,
          }
        )
      end
    end
  end
end
