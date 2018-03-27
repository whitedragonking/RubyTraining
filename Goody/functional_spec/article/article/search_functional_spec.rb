# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.dirname(__FILE__) + '/../../../core/article'

set :database, 'sqlite3:./../../../test-app.sqlite3'

describe Article do
  describe '#search' do
    let(:target) { described_class.new }
    subject { target.search(params,m_start, m_end) }

    # context 'when params == nil' do
    #   let(:params) { nil }
    #   it 'result' do
    #     expect { subject }.to raise_error(NoMethodError)
    #   end
    # end

    context 'when params != nil' do
      context 'when keyword nil || keyword == blank' do
        let(:params) do
          {
            :user_id => double('user_id'),
            :keyword => nil
          }
        end
        let(:m_start) { double('m_start') }
        let(:m_end) { double('m_end') }
        let(:expected) { double('') }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
      # context 'when prams == nil' do
      #   let(:m_start) { nil }
      #   context 'when m_end == nil' do
      #     let(:m_end) { nil }
      #     it 'result' do
      #       is_expected.to eq([])
      #     end
      #   end
      # end
    end

  end
end
