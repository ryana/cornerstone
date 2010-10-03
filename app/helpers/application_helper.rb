module ApplicationHelper

  def page_heading
    @page_heading || '&nbsp'.html_safe
  end

  def aside_heading
    @aside_heading || '&nbsp'.html_safe
  end

  def navigation_content
    @navigation_content || render(:partial => 'shared/navigation')
  end

end
