module Api
    class ProductsController < ApiController
      def index
        # instance variable @products store all products 
        @products = Product.all
        render json: @products.map { |product|
                       product.as_json(except: %i[created_at updated_at category_id],
                                       include: { category: { only: %i[id name] } })
                     }
      end
  
      def search
        # instance variable @products store all products whose names match with params[:q]
        # the first element in the list is a template and the second is a parameter to fill
        # that template ,this avoids sql injection
        @products=Product.where(["lower(name) LIKE ?","%#{params[:q].downcase}%"])
        render json: @products.map { |product|
          product.as_json(except: %i[created_at updated_at category_id],
                          include: { category: { only: %i[id name] } })
        }
      end
    end
end