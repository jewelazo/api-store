module Api
    class ProductsController < ApiController
      def index
        @products = Product.all
        render json: @products.map { |product|
                       product.as_json(except: %i[created_at updated_at category_id],
                                       include: { category: { only: %i[id name] } })
                     }
      end
  
      def search
        @products=Product.where(["lower(name) LIKE ?","%#{params[:q].downcase}%"])
        render json: @products.map { |product|
          product.as_json(except: %i[created_at updated_at category_id],
                          include: { category: { only: %i[id name] } })
        }
      end
    end
end