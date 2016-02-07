module HtmlHelper

  PROVIDE_FOLDER_NAME = 'provide'

  def load_provide(template)
    render :file => File.join(File.dirname(template), PROVIDE_FOLDER_NAME, provide_file_name(template))
  end

  def provide_file_name(template)
    [File.basename(template, '.html.haml'), :provide, :haml].join('.')
  end

  def responsive_toggler
    link_to('',
            "javascript:;",
            class: "menu-toggler responsive-toggler",
            "data-toggle": "collapse",
            "data-target": ".navbar-collapse")
  end

  def note(**opts, &block)
    note_type = opts.fetch(:type){:info}
    note_content = Array.new.tap do |nc|
      nc << content_tag(:h4, opts.fetch(:title){note_type}, :class => :block)
      nc << content_tag(:p, capture(&block))
    end.join.html_safe
    content_tag(:div, note_content, class: [:note, [:note, note_type].join('-')])
  end

  def inline_checkbox(model, attribute, options, value)
    checkbox = check_box(model, attribute, options, value, nil)
    content_tag(:label, checkbox + I18n.t("activerecord.options.#{model}.#{attribute}.#{value}"), class: 'checkbox-inline')
  end

end