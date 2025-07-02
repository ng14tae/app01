module ApplicationHelper
  def page_title(title = "")
    base_title = "買い物リスト（仮）"
    title.present? ? "#{title} | #{base_title}" : base_title
  end
end
