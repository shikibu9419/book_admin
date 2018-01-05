module ApplicationHelper
  def to_half_width(str)
    str.tr('Ａ-Ｚａ-ｚ', 'A-Za-z')
  end
end
