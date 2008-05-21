class TaskRenderer < WillPaginate::LinkRenderer

  def to_html
    links = @options[:page_links] ? windowed_links : []    

    # previous/next buttons
    links.unshift prev_link_or_span(@collection.previous_page, 'disabled', @options[:prev_label])
    links.push    next_link_or_span(@collection.next_page,     'disabled', @options[:next_label])

    html = links.join(@options[:separator])
    @options[:container] ? @template.content_tag(:div, html, html_attributes) : html
  end
  
  protected

  def gap_marker; '<span>...</span>'; end

  def next_link_or_span(page, span_class = 'current', text = nil)
    text ||= page.to_s
    if page and page != current_page
      @template.link_to "text", url_for(page), :rel => rel_value(page), :class => "next"
    else
      @template.content_tag :span, text, :class => span_class
    end
  end

  def prev_link_or_span(page, span_class = 'current', text = nil)
    text ||= page.to_s
    if page and page != current_page
      @template.link_to text, url_for(page), :rel => rel_value(page), :class => "previous"
    else
      @template.content_tag :span, text, :class => span_class
    end
  end
  
end
