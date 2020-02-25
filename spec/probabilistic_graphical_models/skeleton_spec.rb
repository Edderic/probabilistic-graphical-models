require_relative '../../lib/probabilistic_graphical_models/skeleton.rb'
require_relative '../../lib/probabilistic_graphical_models/variable.rb'

describe ProbabilisticGraphicalModels::Skeleton do
  describe "find_variable(string_name)" do
    subject do
      instance.find_variable(string_name)
    end

    let(:instance) do
      described_class.new(
        variable_names: variable_names,
      )
    end

    let(:variable_names) do
      ['coin flip 1', 'coin flip 2']
    end

    context "when string_name is in the list of variable names" do
      let(:string_name) do
        'coin flip 1'
      end

      it "should return an instance of the variable" do
        expect(subject.name).to eq(string_name)
      end
    end

    context "when graph is complete" do
      before(:each) do
        instance.complete!
      end

      context "when first coin flip is the variable we are trying to find" do
        let(:string_name) do
          'coin flip 1'
        end

        specify "coin flip 1 should have coin flip 2 as its neighbor" do
          expect(subject.neighbors.map(&:name)).to include('coin flip 2')
        end
      end

      context "when second coin flip is the variable we are trying to find" do
        let(:string_name) do
          'coin flip 2'
        end

        specify "coin flip 2 should have coin flip 1 as its neighbor" do
          expect(subject.neighbors.map(&:name)).to include('coin flip 1')
        end
      end
    end
  end
end
