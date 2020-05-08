# frozen_string_literal: true

module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def hide_default_layout
    content_for(:hide_default_layout) { 'hide' }
  end
end
