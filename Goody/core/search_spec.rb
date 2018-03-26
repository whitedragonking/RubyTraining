# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.dirname(__FILE__) + '/article'

describe Article do
  describe '#search' do
    let(:target) { described_class.new }
    subject { target.search(params, m_start, m_end) }

    context 'when invalid params' do
      before :each do
        allow(target).to receive(:search_check_user_id).and_raise(NoMethodError)
        allow(target).to receive(:get_data_have_range).and_return(get_data_have_range_response)
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:params) { nil }
      let(:m_start) { double('m_start') }
      let(:m_end) { double('m_end') }
      let(:expected) { NoMethodError }
      context 'params = nil' do
        let(:search_check_user_id) { '' }
        let(:run_sql_response) { '' }
        let(:get_data_have_range_response) { '' }
        it 'result' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end

    context 'when invalid params' do
      before :each do
        allow(target).to receive(:search_check_user_id).and_return(search_check_user_id_response)
        allow(target).to receive(:get_data_have_range).and_return(get_data_have_range_response)
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:params) do
        {
            :keyword => 'a',
            :user_id => double('user_id')
        }
      end
      let(:m_start) { double('m_start') }
      let(:m_end) { double('m_end') }
      let(:expected) { run_sql_response }
      context 'user_id == nil || user_id <= 0 keyword != nil && keyword != blank' do
        let(:search_check_user_id_response) { 'SELECT c.public, t.id, t.title, t.category,t.attention, t.numberic,t.description,t.art_img,CASE WHEN t.public IS NULL THEN '' ELSE t.public END AS public FROM articles AS t LEFT JOIN (SELECT id,public FROM categories) AS c ON c.id = t.category' }
        let(:get_data_have_range_response) { " LIMIT #{m_start},#{m_end}" }
        let(:run_sql_response) { "SELECT c.public, t.id, t.title, t.category,t.attention, t.numberic,t.description,t.art_img,CASE WHEN t.public IS NULL THEN '' ELSE t.public END AS public FROM articles AS t LEFT JOIN (SELECT id,public FROM categories) AS c ON c.id = t.category" + " WHERE t.del_flg = 0  AND (t.title LIKE '%#{params[:keyword]}%') AND t.display_flg = 0 AND c.public = 1 ORDER BY t.attention DESC, t.numberic DESC, t.id DESC" + " LIMIT #{m_start},#{m_end}" }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when invalid params' do
      before :each do
        allow(target).to receive(:search_check_user_id).and_return(search_check_user_id_response)
        allow(target).to receive(:get_data_have_range).and_return(get_data_have_range_response)
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:params) do
        {
            :keyword => 'a',
            :user_id => 1
        }
      end
      let(:m_start) { double('m_start') }
      let(:m_end) { double('m_end') }
      let(:expected) { run_sql_response }
      context 'user_id != nil && user_id > 0 keyword != nil && keyword != blank' do
        let(:search_check_user_id_response) { "SELECT c.public, t.id, t.title, t.category,t.attention, t.numberic,t.description,t.art_img,CASE WHEN t.public IS NULL THEN '' ELSE t.public END AS public,d.status AS like_status FROM articles AS t LEFT JOIN (SELECT article_id,status FROM like_statuses WHERE user_id=#{params[:user_id]}) AS d ON t.id = d.article_id LEFT JOIN (SELECT id,public FROM categories) AS c ON c.id = t.category" }
        let(:get_data_have_range_response) { " LIMIT #{m_start},#{m_end}" }
        let(:run_sql_response) { "SELECT c.public, t.id, t.title, t.category,t.attention, t.numberic,t.description,t.art_img,CASE WHEN t.public IS NULL THEN '' ELSE t.public END AS public,d.status AS like_status FROM articles AS t LEFT JOIN (SELECT article_id,status FROM like_statuses WHERE user_id=#{params[:user_id]}) AS d ON t.id = d.article_id LEFT JOIN (SELECT id,public FROM categories) AS c ON c.id = t.category" + " WHERE t.del_flg = 0  AND (t.title LIKE '%#{params[:keyword]}%') AND t.display_flg = 0 AND c.public = 1 ORDER BY t.attention DESC, t.numberic DESC, t.id DESC" + " LIMIT #{m_start},#{m_end}" }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when invalid params' do
      before :each do
        allow(target).to receive(:search_check_user_id).and_return(search_check_user_id_response)
        allow(target).to receive(:get_data_have_range).and_return(get_data_have_range_response)
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:params) do
        {
            :keyword => double('keyword'),
            :user_id => double('user_id')
        }
      end
      let(:m_start) { double('m_start') }
      let(:m_end) { double('m_end') }
      let(:expected) { run_sql_response }
      context 'keyword == nil || keyword == blank' do
        let(:search_check_user_id_response) { '' }
        let(:get_data_have_range_response) { '' }
        let(:run_sql_response) { '' }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
    end

  end
end