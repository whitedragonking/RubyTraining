# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.dirname(__FILE__) + './article'

describe Article do
  describe '#get_article_have_category' do
    let(:target) { described_class.new }
    subject { target.get_article_have_category(params) }
    context 'when invalid params' do
      let(:params) { nil }
      let(:expected) { get_article_have_category_response }
      context 'params = nil' do
        let(:get_article_have_category_response) { NoMethodError }
        it 'check result' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end

    context 'when invalid user_id' do
      let(:params) do
        { :category_id => nil }
      end
      let(:expected) { get_article_have_category_response }
      context 'category_id = nil or category_id <= 0' do
        let(:get_article_have_category_response) { '' }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when valid category_id' do
      let(:params) do
        { :category_id => 2 }
      end
      let(:expected) { get_article_have_category_response }
      context 'category_id > 0' do
        let(:get_article_have_category_response) { " AND t.category = #{params[:category_id]}" }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end
  end
end
