require_relative '../../lib/probabilistic_graphical_models/variable.rb'
require 'rspec'

describe ProbabilisticGraphicalModels::Variable do
  describe "neighbors" do
    context "on initialize" do
      subject do
        described_class.new(name: 'coin_flip_1').neighbors
      end

      it "should be empty" do
        expect(subject).to be_empty
      end
    end
  end

  describe "name" do
    subject do
      described_class.new(name: name).name
    end

    let(:name) do
      'coin_flip_1'
    end

    it "should return the name" do
      expect(subject).to eq name
    end
  end
end
