RSpec.describe Account::Import do
  let(:import) { described_class.new("#{fixtures_path}/inbox/") }

  describe '#read_dir' do
    subject { import.read_dir }

    it 'returns the correct number of accounts' do
      expect(subject.count).to eq 2
    end

    context 'with structure' do
      it 'keeps right format of account name' do
        subject.keys.each do |account|
          expect(/U\d+/.match(account)).to_not be_nil
        end
      end

      it 'keeps right format of date' do
        subject.each do |_account, dates|
          dates.keys.each do |date|
            expect(/\d+/.match(date)).to_not be_nil
          end
        end
      end

      it 'keeps right list of values' do
        subject.each do |_account, dates|
          dates.each do |_date, types|
            types.each do |type|
              expect([:account, :activity, :position, :security]).to include type
            end
          end
        end
      end
    end
  end
end
