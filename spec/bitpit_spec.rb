require 'helper'

describe PoolStats::Bitpit do
  before do
    stub_request(:get, 'https://pool.bitp.it/api/pool').
      to_return(:status => 200, :body => fixture('bitpit.json'))
    @client = PoolStats::Bitpit.new
  end
  describe '#hash_rate' do
    it 'should fetch the hash rate' do
      hash_rate = @client.hash_rate

      a_request(:get, 'https://pool.bitp.it/api/pool').
        should have_been_made.once

      hash_rate.should == 54.116420575651695
    end
  end
  describe '#round' do
    it 'should fetch the current round' do
      round = @client.round

      a_request(:get, 'https://pool.bitp.it/api/pool').
        should have_been_made.once

      round.should == 27
    end
  end

  describe '#shares' do
    it 'should fetch the shares of this round' do
      shares = @client.shares

      a_request(:get, 'https://pool.bitp.it/api/pool').
        should have_been_made.once

      shares.should == 130947
    end
  end

  describe '#difficulty' do
    it 'should fetch the current block difficulty' do
      difficulty = @client.difficulty

      a_request(:get, 'https://pool.bitp.it/api/pool').
        should have_been_made.once

      difficulty.should == 1888786.70535305
    end
  end

  describe '#duration' do
    it 'should fetch the current round duration' do
      duration = @client.duration

      a_request(:get, 'https://pool.bitp.it/api/pool').
        should have_been_made.once

      duration.should == 10237.seconds
    end
  end

  describe '#round_start' do
    it 'should fetch the current round start date' do
      round_start = @client.round_start

      a_request(:get, 'https://pool.bitp.it/api/pool').
        should have_been_made.once

      round_start.should == Date.parse('2011-08-08T01:06:02Z')
    end
  end

  describe '#pps_price' do
    it 'should fetch the current pay per share price' do
      pps_price = @client.pps_price

      a_request(:get, 'https://pool.bitp.it/api/pool').
        should have_been_made.once

      pps_price.should == 0.00002647202029657131
    end
  end
end
