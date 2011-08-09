require 'active_support/core_ext/numeric/time'
require 'faraday'
require 'faraday/request/url_encoded'
require 'faraday/response/raise_error'
require 'faraday/response/parse_json'
require 'faraday_middleware'
require 'pool_stats/version'


module PoolStats
  class Bitpit
    def hash_rate
      get('/api/pool')['ghashes_ps'].to_f
    end

    def round
      get('/api/pool')['round'].to_i
    end

    def shares
      get('/api/pool')['shares']
    end

    def difficulty
      get('/api/pool')['difficulty']
    end

    def duration
      get('/api/pool')['duration'].seconds
    end

    def round_start
      Date.parse get('/api/pool')['round_start']
    end

    def pps_price
      get('/api/pool')['pps_price'].to_f
    end

    private
    def get(path)
      connection.get(path).body
    end

    def connection
      options = {
        :headers  => {
          :accept => 'application/json',
          :user_agent => "pool_stats gem #{PoolStats::VERSION}",
        },
        :url => 'https://pool.bitp.it'
      }

      Faraday.new(options) do |connection|
        connection.use Faraday::Response::RaiseError
        connection.use Faraday::Response::ParseJson
        connection.adapter(Faraday.default_adapter)
      end
    end
  end
end
