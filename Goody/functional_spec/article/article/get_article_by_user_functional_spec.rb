# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.dirname(__FILE__) + '/../../../core/article'

set :database, 'sqlite3:./../../../test-app.sqlite3'

describe Article do
  describe '#get_article_by_user' do
    let(:target) { described_class.new }
    subject { target.get_article_by_user(user_id) }

    context 'when user_id == nil' do
      let(:user_id) { nil }
      it 'result' do
        expect { subject }.to raise_error(ActiveRecord::StatementInvalid)
      end
    end
    context 'when user_id != nil' do
      context 'when user_id == string' do
        let(:user_id) { 'a' }
        it "result" do
          expect { subject }.to raise_error(ActiveRecord::StatementInvalid)
        end
      end
      context 'when user_id == number && user_id < 0' do
        let(:user_id) { -1 }
        it "result" do
          is_expected.to eq([])
        end
      end
      context 'when user_id == number && user_id > 0' do
        let(:user_id) { 1 }
        let(:response) do
          [{
               :id => 10,
               :numberic => 3,
               :title => '記事タイトル１ 10',
               :art_img => '10.png',
               :attention => 1,
               :description => "<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１<\/p>\\r\\n",
               :category => 10,
               :public => '2016-06-03 14:52:38',
               :display_flg => 0
           }, {
               :id => 9,
               :numberic => 3,
               :title => '記事タイトル１ 9',
               :art_img => '9.png',
               :attention => 1,
               :description => '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１<\/p>\\r\\n',
               :category => 9,
               :public => '2016-06-03 14:52:38',
               :display_flg => 0
           }, {
               :id => 8,
               :title => '記事タイトル１ 8',
               :numberic => 3,
               :art_img => '8.png',
               :attention => 1,
               :description => '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１<\/p>\\r\\n',
               :category => 8,
               :public => '2016-06-03 14:52:38',
               :display_flg => 0
           }, {
               :id => 8,
               :title => '記事タイトル１ 8',
               :numberic => 3,
               :art_img => '8.png',
               :attention => 1,
               :description => '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１<\/p>\\r\\n',
               :category => 8,
               :public => '2016-06-03 14:52:38',
               :display_flg => 0
           }, {
               :id => 7,
               :title => '記事タイトル１ 7',
               :numberic => 3,
               :art_img => '7.png',
               :attention => 1,
               :description => '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１<\/p>\\r\\n',
               :category => 7,
               :public => '2016-06-03 14:52:38',
               :display_flg => 0
           }, {
               :id => 6,
               :title => '記事タイトル１ 6',
               :numberic => 3,
               :art_img => '6.png',
               :attention => 1,
               :description => '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１<\/p>\\r\\n',
               :category => 6,
               :public => '2016-06-03 14:52:38',
               :display_flg => 0
           }, {
               :id => 5,
               :title => '記事タイトル１ 5',
               :numberic => 3,
               :art_img => '5.png',
               :attention => 1,
               :description => '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１<\/p>\\r\\n',
               :category => 5,
               :public => '2016-06-03 14:52:38',
               :display_flg => 0
           }, {
               :id => 4,
               :title => '記事タイトル１ 4',
               :numberic => 3,
               :art_img => '4.png',
               :attention => 1,
               :description => '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１<\/p>\\r\\n',
               :category => 4,
               :public => '2016-06-03 14:52:38',
               :display_flg => 0
           }, {
               :id => 3,
               :title => '記事タイトル１ 3',
               :numberic => 3,
               :art_img => '3.png',
               :attention => 1,
               :description => '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１<\/p>\\r\\n',
               :category => 3,
               :public => '2016-06-03 14:52:38',
               :display_flg => 0
           }, {
               :id => 2,
               :title => '記事タイトル１ 2',
               :numberic => 3,
               :art_img => '2.png',
               :attention => 1,
               :description => '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１<\/p>\\r\\n',
               :category => 2,
               :public => '2016-06-03 14:52:38',
               :display_flg => 0,
           }, {
               :id => 1,
               :title => '記事タイトル１ 1',
               :numberic => 3,
               :art_img => '1.png',
               :attention => 1,
               :description => '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１<\/p>\\r\\n',
               :category => 1,
               :public => '2016-06-03 14:52:38',
               :display_flg => 0
           }
          ]
        end
        let(:expected) { JSON.parse(response.to_json, object_class: Article) }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
    end

  end
end
