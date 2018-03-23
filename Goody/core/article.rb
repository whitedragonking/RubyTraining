# -*- encoding: utf-8 -*-
# frozen_string_literal: true
require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'

set :database, "sqlite3:./../test-app.sqlite3"

class Article < ActiveRecord::Base
  # self.table_name = 'articles'
  def get_article
    sql = get_article_have_user_id(nil) + ' WHERE t.del_flg = 0 AND t.display_flg = 0' + get_article_have_category(nil) + ' ORDER BY t.attention DESC, t.numberic DESC, t.id DESC' + get_data_have_range(nil, nil)
    puts sql
    run_sql(sql)
  end

  def get_article_by_cat(params, m_start, m_end)
    sql = get_article_have_user_id(params) + ' WHERE t.del_flg = 0 AND t.display_flg = 0' + get_article_have_category(params) + ' ORDER BY t.attention DESC, t.numberic DESC, t.id DESC' + get_data_have_range(m_start, m_end)
    run_sql(sql)
  end

  def get_article_have_user_id(params)
    # puts "return with variable"
    if !params[:user_id].nil? && params[:user_id].positive?
      "SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public,d.status AS like_status FROM articles AS t LEFT JOIN (SELECT article_id,status FROM like_statuses WHERE user_id=#{params[:user_id]}) AS d ON t.id = d.article_id"
    else
      "SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public FROM articles AS t"
    end
  end

  def get_article_have_category(params)
    if !params[:category_id].nil? && params[:category_id].positive?
      " AND t.category = #{params[:category_id]}"
    else
      ''
    end
  end

  def get_data_have_range(m_start, m_end)
    if !m_end.nil? && m_end.positive?
      " LIMIT #{m_start},#{m_end}"
    else
      ''
    end
  end

  def get_article_by_id(id, user_id)
    sql = "SELECT t.id,t.title,t.status,t.category,t.attention,t.numberic,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public,d.status as like_status FROM articles AS t LEFT JOIN (SELECT article_id,status FROM like_statuses WHERE user_id= #{user_id}) AS d ON t.id=d.article_id WHERE t.del_flg=0 AND t.id=#{id} AND t.display_flg = 0"
    puts sql
    run_sql(sql)
  end

  def get_article_by_user(user_id)
    sql = "SELECT t.id, t.title, t.category, t.attention, t.numberic,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public,d.status as like_status FROM articles AS t
            RIGHT JOIN (SELECT  article_id,status FROM like_statuses WHERE user_id='#{user_id}' AND status=1) AS d ON t.id = d.article_id WHERE t.del_flg = 0 AND t.display_flg = 0
             ORDER BY t.attention DESC, t.numberic DESC, t.id DESC"
    puts sql
    run_sql(sql)
  end

  def search(params, m_start, m_end)
    sql = search_check_user_id(params) + " WHERE t.del_flg = 0  AND (t.title LIKE '%#{params[:keyword]}%') AND t.display_flg = 0 AND c.public = 1 ORDER BY t.attention DESC, t.numberic DESC, t.id DESC" + get_data_have_range(m_start, m_end)
    puts sql
    run_sql(sql) if !params[:keyword].nil? && !params[:keyword].blank?
  end

  def search_check_user_id(params)
    if !params[:user_id].nil? && params[:user_id].positive?
      "SELECT c.public, t.id, t.title, t.category,t.attention, t.numberic,t.description,t.art_img,CASE WHEN t.public IS NULL THEN '' ELSE t.public END AS public,d.status AS like_status FROM articles AS t LEFT JOIN (SELECT article_id,status FROM like_statuses WHERE user_id=#{params[:user_id]}) AS d ON t.id = d.article_id LEFT JOIN (SELECT id,public FROM categories) AS c ON c.id = t.category"
    else
      "SELECT c.public, t.id, t.title, t.category,t.attention, t.numberic,t.description,t.art_img,CASE WHEN t.public IS NULL THEN '' ELSE t.public END AS public FROM articles AS t LEFT JOIN (SELECT id,public FROM categories) AS c ON c.id = t.category"
    end
  end

  def run_sql(sql)
    article = Article.find_by_sql(sql)
    article.empty? ? [] : article.to_ary
  end
end
