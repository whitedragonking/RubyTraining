# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.dirname(__FILE__) + '/../../../core/article'

set :database, 'sqlite3:./../../../test-app.sqlite3'

describe Article do
  describe '#get_article_have_range' do
    let(:target) { described_class.new }
    subject { target.get_data_have_range(m_start, m_end) }

    context 'when m_start == nil' do
      let(:m_start) { nil }
      context 'when m_end == nil' do
        let(:m_end) { nil }
        let(:expected) { '' }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
      context 'when m_end == string' do
        let(:m_end) { 'a' }
        let(:expected) { '' }
        it 'result' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
      context 'when m_end is number && m_end < 0' do
        let(:m_end) { -1 }
        let(:expected) { '' }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
      context 'when m_end is number && m_end > 0' do
        let(:m_end) { 1 }
        let(:expected) { " LIMIT #{m_start},#{m_end}" }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when m_start == string' do
      let(:m_start) { 'a' }
      context 'when m_end == nil' do
        let(:m_end) { nil }
        let(:expected) { '' }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
      context 'when m_end == string' do
        let(:m_end) { 'a' }
        let(:expected) { '' }
        it 'result' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
      context 'when m_end is number && m_end < 0' do
        let(:m_end) { -1 }
        let(:expected) { '' }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
      context 'when m_end is number && m_end > 0' do
        let(:m_end) { 1 }
        let(:expected) { " LIMIT #{m_start},#{m_end}" }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when m_start == number' do
      let(:m_start) { 1 }
      context 'when m_end == nil' do
        let(:m_end) { nil }
        let(:expected) { '' }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
      context 'when m_end == string' do
        let(:m_end) { 'a' }
        let(:expected) { '' }
        it 'result' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
      context 'when m_end is number && m_end < 0' do
        let(:m_end) { -1 }
        let(:expected) { '' }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
      context 'when m_end is number && m_end > 0' do
        let(:m_end) { 1 }
        let(:expected) { " LIMIT #{m_start},#{m_end}" }
        it 'result' do
          is_expected.to eq(expected)
        end
      end
    end

  end
end
