module DatatableList
  extend ActiveSupport::Concern

  included do

    def datatable_list
      @response = self.list_all
      decorator = self.decorator_name.constantize
      @data = @response.map{|g| decorator.send(:new, g).send(:format) }
      
      respond_to do |format|
        format.json { render 'shared/search' }
      end
    end
  
    def list_all
      model = self.model_name.camelcase.constantize
      model.send(:includes, :user).send(:all)
    end
    
    def model_name
      @model_name ||= controller_name.classify
    end

    def decorator_name
      @decorator_name ||= "#{self.model_name}Decorator"
    end
  end

end