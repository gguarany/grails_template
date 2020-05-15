# frozen_string_literal: false

module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def hide_default_layout
    content_for(:hide_default_layout) { 'hide' }
  end

  def icon(name, html_options = {})
    content_class = "fe fe-#{name}"
    content_class << " #{html_options[:class]}" if html_options.key?(:class)
    html_options[:class] = content_class

    html = content_tag(:i, nil, html_options)

    html
  end
end
