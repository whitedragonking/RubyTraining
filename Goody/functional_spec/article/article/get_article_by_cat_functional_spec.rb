# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.dirname(__FILE__) + '/../../../core/article'

set :database, 'sqlite3:./../../../test-app.sqlite3'

describe Article do
  describe '#get_article_by_cat' do
    let(:target) { described_class.new }
    subject { target.get_article_by_cat(params, m_start, m_end) }

    context 'when invalid params' do
      let(:params) { nil }
      let(:m_start) { double('m_start') }
      let(:m_end) { double('m_end') }
      context 'params = nil' do
        it 'check result' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end

    context 'when user_id == nil' do
    let(:params) do
      {
          :user_id => nil,
          :category_id => category_id
      }
    end

      context 'm_category == nil' do
        let(:category_id) { nil }
        context 'm_end == nil || m_end is not positive' do
          let(:m_start) { double('m_start') }
          let(:m_end) { nil }
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
          it 'check result' do
            is_expected.to eq(expected)
          end
        end

        context 'm_end != nil && m_end is positive' do
          let(:m_start) { 0 }
          let(:m_end) { 1 }
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
             }
            ]
          end
          let(:expected) { JSON.parse(response.to_json, object_class: Article) }
          it 'check result' do
            is_expected.to eq(expected)
          end
        end
      end

      context 'm_category != nil' do
        let(:category_id) { 10 }
        context 'm_end == nil || m_end is not positive' do
          let(:m_start) { double('m_start') }
          let(:m_end) { nil }
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
                }
                ]
          end
          let(:expected) { JSON.parse(response.to_json, object_class: Article) }
          it 'check result' do
            is_expected.to eq(expected)
          end
        end

        context 'm_end != nil && m_end is positive' do
          let(:m_start) { 0 }
          let(:m_end) { 1 }
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
             }
            ]
          end
          let(:expected) { JSON.parse(response.to_json, object_class: Article) }
          it 'check result' do
            is_expected.to eq(expected)
          end
        end
      end
    end

    context 'when user_id != nil' do
      let(:params) do
        {
          :user_id => 1,
          :category_id => category_id
        }
      end

      context 'm_category == nil' do
        let(:category_id) { nil }
        context 'm_end == nil || m_end is not positive' do
          let(:m_start) { double('m_start') }
          let(:m_end) { nil }
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
            }]
          end
          let(:expected) { JSON.parse(response.to_json, object_class: Article) }
          it 'check result' do
            is_expected.to eq(expected)
          end
        end

        context 'm_end != nil && m_end is positive' do
          let(:m_start) { 0 }
          let(:m_end) { 1 }
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
             }
            ]
          end
          let(:expected) { JSON.parse(response.to_json, object_class: Article) }
          it 'check result' do
            is_expected.to eq(expected)
          end
        end
      end

      context 'm_category != nil' do
        let(:category_id) { 10 }
        context 'm_end == nil || m_end is not positive' do
          let(:m_start) { double('m_start') }
          let(:m_end) { nil }
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
                }
                ]
          end
          let(:expected) { JSON.parse(response.to_json, object_class: Article) }
          it 'check result' do
            is_expected.to eq(expected)
          end
        end

        context 'm_end != nil && m_end is positive' do
          let(:m_start) { 0 }
          let(:m_end) { 1 }
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
             }
            ]
          end
          let(:expected) { JSON.parse(response.to_json, object_class: Article) }
          it 'check result' do
            is_expected.to eq(expected)
          end
        end
      end
    end
  end
end
