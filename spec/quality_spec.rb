require 'helper'

describe "Gem" do
  it 'can still be built' do
    Dir.chdir(root) do
      `gem build pool_stats.gemspec`
      $?.should == 0
    end
  end
end

def root
  File.expand_path("../..", __FILE__)
end
