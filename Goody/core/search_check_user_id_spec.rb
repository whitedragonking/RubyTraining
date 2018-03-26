# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.dirname(__FILE__) + '/article'

describe Article do
  describe '#search_check_user_id' do
    let(:target) { described_class.new }
    subject { target.search_check_user_id(params) }

    context 'when user_id != nil && user_id > 0' do
      let(:params) { {:user_id => 1} }
      let(:expected) { response }
      context 'user_id != nil && user_id > 0' do
        let(:response) { "SELECT c.public, t.id, t.title, t.category,t.attention, t.numberic,t.description,t.art_img,CASE WHEN t.public IS NULL THEN '' ELSE t.public END AS public,d.status AS like_status FROM articles AS t LEFT JOIN (SELECT article_id,status FROM like_statuses WHERE user_id=#{params[:user_id]}) AS d ON t.id = d.article_id LEFT JOIN (SELECT id,public FROM categories) AS c ON c.id = t.category" }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when user_id == nil || user_id <= 0' do
      let(:params) { {:user_id => nil} }
      let(:expected) { response }
      context 'user_id == nil || user_id <= 0' do
        let(:response) { "SELECT c.public, t.id, t.title, t.category,t.attention, t.numberic,t.description,t.art_img,CASE WHEN t.public IS NULL THEN '' ELSE t.public END AS public FROM articles AS t LEFT JOIN (SELECT id,public FROM categories) AS c ON c.id = t.category" }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end
  end
end
