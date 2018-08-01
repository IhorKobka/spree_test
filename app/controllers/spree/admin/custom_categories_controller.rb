module Spree
  module Admin
    class CustomCategoriesController < ResourceController
      def index
        @collection = Spree::CustomCategory.all
      end
    end
  end
end