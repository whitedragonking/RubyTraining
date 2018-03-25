# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.dirname(__FILE__) + '/article'

describe Article do
  describe '#get_article_by_id' do
    let(:target) { described_class.new }
    subject { target.get_article_by_id(id,user_id) }

    context 'get article' do
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
