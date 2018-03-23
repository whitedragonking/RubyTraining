class LikeStatus
  def initialize
    require File.expand_path '../../core/article', __FILE__
    # require File.expand_path '../../core/like_status', __FILE__
  end

  def get_all_article
    params = {
        :user_id => 1,
        :category_id => 1
    }
    params1 = {
        :user_id => 1,
    }
    # Article.new.get_article.to_json
    Article.new.get_article_by_cat(params, 1, 5).to_json
    # Article.new.get_article_by_cat(params1, 1, 2).to_json
    # Article.new.get_article_by_id(1,3).to_json
  end

  def search
    params = {
        :user_id => 1,
        :category_id => 1,
        :keyword => '事'
    }
    Article.new.search(params,1,10).to_json
    # Article.new.search(params,1,10)
  end

    # def getArticleByUser(userId)
    #
    # end
    #
    # def search(params, mStart = 0, mEnd = 0)
    #
    # end
end