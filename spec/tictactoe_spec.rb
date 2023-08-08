require_relative '../tictactoe'

RSpec.shared_examples 'a winner was detected' do |field|
    it 'detects winner' do
        actual = subject.check_winner(field) #act!
        expect(actual).to eq true #assert!
    end
end

RSpec.shared_examples 'no winner was detected' do |field|
    it 'detects no winner' do
        actual = subject.check_winner(field) #act!
        expect(actual).to eq false #assert!
    end
end

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
            it_behaves_like 'a winner was detected', [['X', 'X', 'X'], ['O', 'O', nil], [nil, nil, nil]] #arrange! (Triple 'A' / AAA)
            it_behaves_like 'a winner was detected', [['X', 'X', 'X'], ['O', 'O', 'O'], [nil, nil, nil]] #arrange! (Triple 'A' / AAA)
            it_behaves_like 'a winner was detected', [['X', 'X', 'X'], ['X', 'X', 'X'], ['X', 'X', 'X']] #arrange! (Triple 'A' / AAA)
            it_behaves_like 'a winner was detected', [['X', 'X', nil], ['O', 'O', 'O'], [nil, nil, nil]] #arrange! (Triple 'A' / AAA)
        end

        context "without a winner" do
            it_behaves_like 'no winner was detected', [[nil, nil, nil], [nil ,nil ,nil ], [nil, nil, nil]] #arrange! (Triple 'A' / AAA)
            it_behaves_like 'no winner was detected', [['X', 'X', 'O'], ['O','O','X' ], ['X','O','X']] #arrange! (Triple 'A' / AAA)
            it_behaves_like 'no winner was detected', [['C', 'C', 'C'], ['O','O','X' ], ['X','O','X']] #arrange! (Triple 'A' / AAA)
        end
    end
    describe "#playerRound" do
        context "valid player round" do
            let(:field) { [[nil, nil, nil], [nil ,nil ,nil ], [nil, nil, nil]] }
            before do 
                allow_any_instance_of(Kernel).to receive(:gets).and_return('2')
                allow_any_instance_of(Kernel).to receive(:puts).and_return(nil) #removed puts output to prettify console log
            end
            it "chooses an empty field" do 
                subject.playerRound(field)
                expect(field[1][1]).to eq 'O'
            end
        end
        context "wrong player input" do
            let(:field) { [[nil, nil, nil], [nil ,nil ,nil ], [nil, nil, nil]] }
            before do 
                allow_any_instance_of(Kernel).to receive(:gets).and_return('4','2')
            end
            it "notifies player about invalid input" do 
                expect{ subject.playerRound(field) }.to output(/TicTacToe Game: Bitte horizontale Koordinate eintragen \(1 bis 3\)\nTicTacToe Game: Bitte horizontale Koordinate eintragen \(1 bis 3\)/).to_stdout
            end
        end
    end
end

