module Spree
  module Admin
    class CustomProductsController < ResourceController
      def index
        @collection = Spree::CustomProduct.all
      end

      def edit
        @product = Spree::CustomProduct.find(params[:id])
        @catalog_image = @product.build_catalog_image
      end

      def create
        image = Spree::CustomProduct.first.product_views.build(attachment: params[:image][:attachment])
        image.save
      end
    end
  end
end


