# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.dirname(__FILE__) + '/../../../core/article'

set :database, 'sqlite3:./test-app.sqlite3'

describe Article do
  describe '#get_data_have_range' do
    let(:target) { described_class.new }
    subject { target.get_data_have_range(m_start,m_end) }
    context 'when invalid params' do
      let(:m_start) { nil }
      let(:m_end) { 1 }
      let(:expected) { get_data_have_range_response }
      context 'm_start = nil' do
        let(:get_data_have_range_response) { " LIMIT #{m_start},#{m_end}" }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when invalid params' do
      let(:m_start) { 1 }
      let(:m_end) { nil }
      let(:expected) { get_data_have_range_response }
      context 'm_end = nil' do
        let(:get_data_have_range_response) { '' }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when invalid params' do
      let(:m_start) { 1 }
      let(:m_end) { -1 }
      let(:expected) { get_data_have_range_response }
      context 'm_end < 0' do
        let(:get_data_have_range_response) { '' }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when invalid params' do
      let(:m_start) { 'a' }
      let(:m_end) { 1 }
      let(:expected) { get_data_have_range_response }
      context 'm_start is not number && m_end > 0' do
        let(:get_data_have_range_response) { " LIMIT #{m_start},#{m_end}" }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when invalid params' do
      let(:m_start) { 'a' }
      let(:m_end) { -1 }
      let(:expected) { get_data_have_range_response }
      context 'm_start is not number && m_end < 0' do
        let(:get_data_have_range_response) { '' }
        it 'check result' do
          is_expected.to eq(expected)
        end
      end
    end

    context 'when invalid params' do
      let(:m_start) { 1 }
      let(:m_end) { 'a' }
      let(:expected) { get_data_have_range_response }
      context 'm_start is number && m_end is not number' do
        let(:get_data_have_range_response) { NoMethodError }
        it 'check result' do
          # is_expected.to eq(expected)
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end

    context 'when invalid params' do
      let(:m_start) { 'a' }
      let(:m_end) { 'a' }
      let(:expected) { get_data_have_range_response }
      context 'm_start is not number and m_end is not number' do
        let(:get_data_have_range_response) { NoMethodError }
        it 'check result' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end

  end
end
