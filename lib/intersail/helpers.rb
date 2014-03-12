module IntersailHelper
  def js_confirm_page_change(msg)
    "$(document).bind('page:before-change', function(e) { if(confirm('#{msg}')) $(document).unbind('page:before-change'); else e.preventDefault(); });".html_safe
  end
end