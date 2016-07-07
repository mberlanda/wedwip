module DatatablesDecorators

  def self.included(base)
    base.extend ClassMethods
    base.define_singleton_method(:dom_id) do
      base.name.match(/^(\S+)Decorator$/)[1].underscore.pluralize
    end
    base.define_singleton_method(:table_id) do
      [dom_id, :table].join('-').downcase
    end
  end

  module ClassMethods
    include Draper::LazyHelpers

    def datatable_columns
      raise "Decorators columms must be defined"
    end

    def datatable_columns_header
      datatable_columns.map{|s| content_tag(:th, I18n.t("#{dom_id}.index.table_header.#{s}"))}.join.html_safe
    end

    def datatable_content
      content_tag(:table, class: 'table table-striped table-bordered table-hover', id: table_id) do
        content_tag(:thead, content_tag(:tr, datatable_columns_header))
      end
    end

  end
end
