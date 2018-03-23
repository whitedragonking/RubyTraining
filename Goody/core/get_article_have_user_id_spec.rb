# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.dirname(__FILE__) + './article'

describe Article do
  describe '#get_article_have_user_id' do
    let(:target) { described_class.new }
    subject { target.get_article_have_user_id(params) }
    context 'when invalid params' do
      let(:params) { nil }
      let(:expected) { get_article_have_user_id_response }
      context 'params = nil' do
        let(:get_article_have_user_id_response) { NoMethodError }
        it 'check result' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end

    context 'when invalid user_id' do
      let(:params) do
        { :user_id => nil }
      end
      let(:expected) { get_article_have_user_id_response }
      context 'user_id = nil or user_id <= 0' do
        let(:get_article_have_user_id_response) { 'SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN \' \' ELSE t.public END AS public FROM articles AS t' }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when valid user_id' do
      let(:params) do
        { :user_id => 2 }
      end
      let(:expected) { get_article_have_user_id_response }
      context 'user_id > 0' do
        let(:get_article_have_user_id_response) { "SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public,d.status AS like_status FROM articles AS t LEFT JOIN (SELECT article_id,status FROM like_statuses WHERE user_id=#{params[:user_id]}) AS d ON t.id = d.article_id" }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end
  end
end
