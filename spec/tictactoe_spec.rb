require_relative '../tictactoe'

RSpec.describe TicTacToe do
    describe "#free?" do
        context "start with empty fields" do
            let(:row) { 1 }
            let(:column) { 1 }
            let(:field) { [[nil, nil, nil], [nil ,nil ,nil ], [nil, nil, nil]] }
            it "detects empty fields" do
                actual = subject.free?(field, row, column)
                expect(actual).to eq true
            end
            context "second turn" do
                let(:field) { [['X', nil, nil], [nil ,nil ,nil], [nil, nil, nil]] }
                it "detects non-empty fields" do
                    actual = subject.free?(field, row, column)
                    expect(actual).to eq false
                end
            end
        end
    end
    describe "#computerRound" do
        context "computer first turn" do
            let(:field) { [['O', nil, nil], [nil ,nil ,nil ], [nil, nil, nil]] }
            it "chooses an empty field" do
                subject.computerRound(field)
                expect(field[0][1]).to eq 'X'
            end
        end
        context "computer last turn, field full" do
            let(:field) { [['O', 'X', 'X'], ['X', 'X', 'O'], ['O', 'X', 'O']] }
            it "tells us the game has ended, no valid plays available" do
                expect { subject.computerRound(field) }.to raise_error(NoMethodError,"undefined method `divmod' for nil:NilClass")
            end
        end
    end
    describe "#check_winner" do
        context "with a winner" do
            let(:field) { [['X', 'X', 'X'], ['O', 'O', nil], [nil, nil, nil]] } #arrange! (Triple 'A' / AAA)
            it "identifies a game over" do
                actual = subject.check_winner(field) #act!
                expect(actual).to eq true #assert!
            end
        end
        context "without a winner" do
            let(:field) { [[nil, 'X', nil], [nil, nil, nil], [nil, nil, nil]] } #arrange! (Triple 'A' / AAA)
            it "identifies NO game over" do
                actual = subject.check_winner(field) #act!
                expect(actual).to eq false #assert!
            end
        end
    end
end