require_relative '../tictactoe'

RSpec.describe TicTacToe do
    context "start with empty fields" do
        let(:row) { 1 }
        let(:column) { 1 }
        let(:field) { [[nil, nil, nil], [nil ,nil ,nil ], [nil, nil, nil]] }
        it "detects empty fields" do
            actual = subject.free?(field, row, column)
            expect(actual).to eq true
        end
        context "second turn" do
            let(:field) { [['X', nil, nil], [nil ,nil ,nil ], [nil, nil, nil]] }
            it "detects non-empty fields" do
                actual = subject.free?(field, row, column)
                expect(actual).to eq false
            end
        end
    end

end