# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.dirname(__FILE__) + '/../../../core/article'

set :database, 'sqlite3:./../../../test-app.sqlite3'

describe Article do
  describe '#get_article_have_user_id' do
    let(:target) { described_class.new }
    subject { target.get_article_have_user_id(params) }
    context 'when invalid params' do
      let(:params) { nil }
      context 'params = nil' do
        it 'check result' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end

    context 'when valid params' do
      context 'when user_id == nil' do
        let(:params) { {:user_id => nil} }
        let(:expected) { 'SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN \' \' ELSE t.public END AS public FROM articles AS t' }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
      context 'when user_id != nil' do
        let(:params) { {:user_id => 1} }
        let(:expected) { "SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public,d.status AS like_status FROM articles AS t LEFT JOIN (SELECT article_id,status FROM like_statuses WHERE user_id=#{params[:user_id]}) AS d ON t.id = d.article_id" }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
    end
  end
end
