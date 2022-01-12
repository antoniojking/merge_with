require 'rspec'
require '../lib/merge'

RSpec.describe Merge do
  let(:hash1) { {:a => 1} }
  let(:hash2) { {:a => 2, :b => 1} }

  it "adds the values of duplicate keys between two hashes" do
    # hash1 = {:a => 1}
    # hash2 = {:a => 2, :b => 1}

    sum = Merge.merge_with(hash1, hash2) do |a, b|
      a + b
    end

    expected = {:a => 3, :b => 1}
    expect(sum).to eq(expected)
  end

  it "subtracts the values of duplicate keys between two hashes" do
    # hash1 = {:a => 1}
    # hash2 = {:a => 2, :b => 1}

    difference = Merge.merge_with(hash1, hash2) do |a, b|
      a - b
    end

    expected = {:a => -1, :b => 1}
    expect(difference).to eq(expected)
  end

  it "concatenates the integer values of duplicate keys between two hashes" do
    # hash1 = {:a => 1}
    # hash2 = {:a => 2, :b => 1}

    concat = Merge.merge_with(hash1, hash2) do |a, b|
      a.to_s.concat(b.to_s).to_i
    end

    expected = {:a => 12, :b => 1}
    expect(concat).to eq(expected)
  end
end
