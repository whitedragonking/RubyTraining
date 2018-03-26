# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.dirname(__FILE__) + '/../../../core/article'

set :database, 'sqlite3:./test-app.sqlite3'

describe Article do
  describe '#get_article_by_cat' do
    let(:target) { described_class.new }
    subject { target.get_article_by_cat(params, m_start, m_end) }

    context 'when invalid params' do
      before :each do
        allow(target).to receive(:get_article_have_user_id).and_raise(NoMethodError)
        allow(target).to receive(:get_article_have_category).and_return(get_article_have_category_response)
        allow(target).to receive(:get_data_have_range).and_return(get_data_have_range_response)
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:params) { double('m_start') }
      let(:m_start) { double('m_start') }
      let(:m_end) { double('m_end') }
      let(:expected) { run_sql_response }
      context 'params = nil' do
        let(:get_article_have_user_id_response) { '' }
        let(:get_article_have_category_response) { '' }
        let(:get_data_have_range_response) { '' }
        let(:run_sql_response) { double('run_sql_response') }
        it 'check result' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end

    context 'when invalid user_id' do
      before :each do
        allow(target).to receive(:get_article_have_user_id).and_raise(NoMethodError)
        allow(target).to receive(:get_article_have_category).and_return(get_article_have_category_response)
        allow(target).to receive(:get_data_have_range).and_return(get_data_have_range_response)
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:params) { double('params') }
      let(:m_start) { double('m_start') }
      let(:m_end) { double('m_end') }
      let(:expected) { run_sql_response }
      context 'user_id = nil or user_id <= 0' do
        let(:get_article_have_user_id_response) { "SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public FROM articles AS t" }
        let(:get_article_have_category_response) { '' }
        let(:get_data_have_range_response) { '' }
        let(:run_sql_response) { double('run_sql_response') }
        it 'check result' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end

    context 'when invalid category_id' do
      before :each do
        allow(target).to receive(:get_article_have_user_id).and_return(get_article_have_user_id_response)
        allow(target).to receive(:get_article_have_category).and_raise(NoMethodError)
        allow(target).to receive(:get_data_have_range).and_return(get_data_have_range_response)
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:params) { double('params') }
      let(:m_start) { double('m_start') }
      let(:m_end) { double('m_end') }
      let(:expected) { run_sql_response }
      context 'category_id = nil or category_id <= 0' do
        let(:get_article_have_user_id_response) { "SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public FROM articles AS t" }
        let(:get_article_have_category_response) { '' }
        let(:get_data_have_range_response) { '' }
        let(:run_sql_response) { double('run_sql_response') }
        it 'check result' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end

    context 'when invalid m_start' do
      before :each do
        allow(target).to receive(:get_article_have_user_id).and_return(get_article_have_user_id_response)
        allow(target).to receive(:get_article_have_category).and_return(get_article_have_category_response)
        allow(target).to receive(:get_data_have_range).and_raise(NoMethodError)
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:params) { double('params') }
      let(:m_start) { nil }
      let(:m_end) { double('m_end') }
      let(:expected) { run_sql_response }
      context 'm_start = nil' do
        let(:get_article_have_user_id_response) { "SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public FROM articles AS t" }
        let(:get_article_have_category_response) { '' }
        let(:get_data_have_range_response) { '' }
        let(:run_sql_response) { double('run_sql_response') }
        it 'check result' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end

    context 'when invalid m_end' do
      before :each do
        allow(target).to receive(:get_article_have_user_id).and_return(get_article_have_user_id_response)
        allow(target).to receive(:get_article_have_category).and_return(get_article_have_category_response)
        allow(target).to receive(:get_data_have_range).and_raise(NoMethodError)
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:params) { double('params') }
      let(:m_start) { double('m_start') }
      let(:m_end) { nil }
      let(:expected) { run_sql_response }
      context 'm_end = nil' do
        let(:get_article_have_user_id_response) { "SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public FROM articles AS t" }
        let(:get_article_have_category_response) { '' }
        let(:get_data_have_range_response) { '' }
        let(:run_sql_response) { double('run_sql_response') }
        it 'check result' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end

    context 'when valid params, m_start, m_end' do
      before :each do
        allow(target).to receive(:get_article_have_user_id).and_return(get_article_have_user_id_response)
        allow(target).to receive(:get_article_have_category).and_return(get_article_have_category_response)
        allow(target).to receive(:get_data_have_range).and_return(get_data_have_range_response)
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:params) do
        { :user_id => 1,
          :category_id => nil }
      end
      let(:m_start) { 0 }
      let(:m_end) { 0 }
      let(:expected) { run_sql_response }
      context 'have user_id but doesn\'t have category_id, m_start is number, m_end is number, m_end = 0' do
        let(:get_article_have_user_id_response) { "SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public,d.status AS like_status FROM articles AS t LEFT JOIN (SELECT article_id,status FROM like_statuses WHERE user_id=#{params[:user_id]}) AS d ON t.id = d.article_id" }
        let(:get_article_have_category_response) { '' }
        let(:get_data_have_range_response) { '' }
        let(:run_sql_response) { double('run_sql_response') }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when valid params, m_start, m_end' do
      before :each do
        allow(target).to receive(:get_article_have_user_id).and_return(get_article_have_user_id_response)
        allow(target).to receive(:get_article_have_category).and_return(get_article_have_category_response)
        allow(target).to receive(:get_data_have_range).and_return(get_data_have_range_response)
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:params) do
        { :user_id => 1,
          :category_id => nil }
      end
      let(:m_start) { 0 }
      let(:m_end) { 1 }
      let(:expected) { run_sql_response }
      context 'have user_id but doesn\'t have category_id, m_start is number, m_end is number, m_end > 0' do
        let(:get_article_have_user_id_response) { "SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public,d.status AS like_status FROM articles AS t LEFT JOIN (SELECT article_id,status FROM like_statuses WHERE user_id=#{params[:user_id]}) AS d ON t.id = d.article_id" }
        let(:get_article_have_category_response) { '' }
        let(:get_data_have_range_response) { " LIMIT #{m_start},#{m_end}" }
        let(:run_sql_response) { double('run_sql_response') }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when valid params, m_start, m_end' do
      before :each do
        allow(target).to receive(:get_article_have_user_id).and_return(get_article_have_user_id_response)
        allow(target).to receive(:get_article_have_category).and_return(get_article_have_category_response)
        allow(target).to receive(:get_data_have_range).and_return(get_data_have_range_response)
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:params) do
        { :user_id => 1,
          :category_id => nil }
      end
      let(:m_start) { 0 }
      let(:m_end) { 0 }
      let(:expected) { run_sql_response }
      context 'have user_id and category_id, m_start is number, m_end is number, m_end = 0' do
        let(:get_article_have_user_id_response) { "SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public,d.status AS like_status FROM articles AS t LEFT JOIN (SELECT article_id,status FROM like_statuses WHERE user_id=#{params[:user_id]}) AS d ON t.id = d.article_id" }
        let(:get_article_have_category_response) { " AND t.category = #{params[:category_id]}" }
        let(:get_data_have_range_response) { '' }
        let(:run_sql_response) { double('run_sql_response') }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when valid params, m_start, m_end' do
      before :each do
        allow(target).to receive(:get_article_have_user_id).and_return(get_article_have_user_id_response)
        allow(target).to receive(:get_article_have_category).and_return(get_article_have_category_response)
        allow(target).to receive(:get_data_have_range).and_return(get_data_have_range_response)
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:params) do
        { :user_id => 1,
          :category_id => nil }
      end
      let(:m_start) { 0 }
      let(:m_end) { 1 }
      let(:expected) { run_sql_response }
      context 'have user_id but doesn\'t have category_id, m_start is number, m_end is number, m_end > 0' do
        let(:get_article_have_user_id_response) { "SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public,d.status AS like_status FROM articles AS t LEFT JOIN (SELECT article_id,status FROM like_statuses WHERE user_id=#{params[:user_id]}) AS d ON t.id = d.article_id" }
        let(:get_article_have_category_response) { " AND t.category = #{params[:category_id]}" }
        let(:get_data_have_range_response) { " LIMIT #{m_start},#{m_end}" }
        let(:run_sql_response) { double('run_sql_response') }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when valid params, m_start, m_end' do
      before :each do
        allow(target).to receive(:get_article_have_user_id).and_return(get_article_have_user_id_response)
        allow(target).to receive(:get_article_have_category).and_return(get_article_have_category_response)
        allow(target).to receive(:get_data_have_range).and_return(get_data_have_range_response)
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:params) { double('params') }
      let(:m_start) { 0 }
      let(:m_end) { 0 }
      let(:expected) { run_sql_response }
      context 'doesn\'t have user_id and category_id, m_start is number, m_end is number, m_end = 0' do
        let(:get_article_have_user_id_response) { "SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public FROM articles AS t" }
        let(:get_article_have_category_response) { '' }
        let(:get_data_have_range_response) { '' }
        let(:run_sql_response) { double('run_sql_response') }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when valid params, m_start, m_end' do
      before :each do
        allow(target).to receive(:get_article_have_user_id).and_return(get_article_have_user_id_response)
        allow(target).to receive(:get_article_have_category).and_return(get_article_have_category_response)
        allow(target).to receive(:get_data_have_range).and_return(get_data_have_range_response)
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:params) { double('params') }
      let(:m_start) { 0 }
      let(:m_end) { 1 }
      let(:expected) { run_sql_response }
      context 'doesn\'t have user_id and category_id, m_start is number, m_end is number, m_end > 0' do
        let(:get_article_have_user_id_response) { "SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public FROM articles AS t" }
        let(:get_article_have_category_response) { '' }
        let(:get_data_have_range_response) { " LIMIT #{m_start},#{m_end}" }
        let(:run_sql_response) { double('run_sql_response') }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when valid params, m_start, m_end' do
      before :each do
        allow(target).to receive(:get_article_have_user_id).and_return(get_article_have_user_id_response)
        allow(target).to receive(:get_article_have_category).and_return(get_article_have_category_response)
        allow(target).to receive(:get_data_have_range).and_return(get_data_have_range_response)
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:params) do
        { :user_id => 1,
          :category_id => nil }
      end
      let(:m_start) { 0 }
      let(:m_end) { 0 }
      let(:expected) { run_sql_response }
      context 'have category_id but doesn\'t have user_id, m_start is number, m_end is number, m_end = 0' do
        let(:get_article_have_user_id_response) { "SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public FROM articles AS t" }
        let(:get_article_have_category_response) { " AND t.category = #{params[:category_id]}" }
        let(:get_data_have_range_response) { '' }
        let(:run_sql_response) { double('run_sql_response') }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when valid params, m_start, m_end' do
      before :each do
        allow(target).to receive(:get_article_have_user_id).and_return(get_article_have_user_id_response)
        allow(target).to receive(:get_article_have_category).and_return(get_article_have_category_response)
        allow(target).to receive(:get_data_have_range).and_return(get_data_have_range_response)
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:params) do
        { :user_id => 1,
          :category_id => nil }
      end
      let(:m_start) { 0 }
      let(:m_end) { 1 }
      let(:expected) { run_sql_response }
      context 'have category_id but doesn\'t have user_id, m_start is number, m_end is number, m_end > 0' do
        let(:get_article_have_user_id_response) { "SELECT t.id, t.title, t.category,t.attention, t.numberic,t.display_flg,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public FROM articles AS t" }
        let(:get_article_have_category_response) { " AND t.category = #{params[:category_id]}" }
        let(:get_data_have_range_response) { " LIMIT #{m_start},#{m_end}" }
        let(:run_sql_response) { double('run_sql_response') }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end
  end

  describe '#get_article_by_id' do
    let(:target) { described_class.new }
    subject { target.get_article_by_id(id,user_id) }

    context 'when invalid params' do
      before :each do
        allow(target).to receive(:run_sql).and_return(run_sql_response)
      end
      let(:id) { double('id') }
      let(:user_id) { double('user_id') }
      let(:expected) { run_sql_response }
      context 'return' do
        let(:run_sql_response) { "SELECT t.id, t.title, t.category, t.attention, t.numberic,t.description,t.art_img,CASE WHEN t.public IS NULL THEN ' ' ELSE t.public END AS public,d.status as like_status FROM articles AS t RIGHT JOIN (SELECT  article_id,status FROM like_statuses WHERE user_id='#{user_id}' AND status=1) AS d ON t.id = d.article_id WHERE t.del_flg = 0 AND t.display_flg = 0 ORDER BY t.attention DESC, t.numberic DESC, t.id DESC" }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end
  end
end
