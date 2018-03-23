class LikeStatus < ActiveRecord::Base
  def get_category
    sql = 'SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img FROM articles AS t'
    article = Article.find_by_sql(sql)
  end
end