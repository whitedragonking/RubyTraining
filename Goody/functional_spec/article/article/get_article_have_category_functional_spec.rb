# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.dirname(__FILE__) + '/../../../core/article'

set :database, 'sqlite3:./../../../test-app.sqlite3'

describe Article do
  describe '#get_article_have_category' do
    let(:target) { described_class.new }
    subject { target.get_article_have_category(params) }
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
        let(:params) { {:category_id => nil} }
        let(:expected) { '' }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
      context 'when user_id != nil' do
        let(:params) { {:category_id => 1} }
        let(:expected) { " AND t.category = #{params[:category_id]}" }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
    end
  end
end
