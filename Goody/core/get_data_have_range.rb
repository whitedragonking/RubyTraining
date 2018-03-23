# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.dirname(__FILE__) + './article'

describe Article do
  describe '#get_data_have_range' do
    let(:target) { described_class.new }
    subject { target.get_data_have_range(m_start,m_end) }
    context 'when invalid params' do
      let(:m_start) { nil }
      let(:m_end) { 1 }
      let(:expected) { get_data_have_range_response }
      context 'm_start = nil' do
        let(:get_data_have_range_response) { NoMethodError }
        it 'check result' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end

    context 'when invalid params' do
      let(:m_start) { 1 }
      let(:m_end) { nil }
      let(:expected) { get_data_have_range_response }
      context 'm_end = nil' do
        let(:get_data_have_range_response) { NoMethodError }
        it 'check result' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end

  end
end
