RSpec.describe Account::View do
  describe '.render' do
    let(:dir) do
      {
        'U79014' => {
          '20150123' => [:account, :position, :security, :activity]
        },
        'U6342' => {
          '20150114' => [:account, :activity, :position, :security],
          '20150113' => [:account, :activity, :position, :security]
        }
      }
    end
    subject { described_class.render(dir) }

    it { is_expected.to include dir.keys[0] }
    it { is_expected.to include dir.keys[1] }

    it { is_expected.to include 'account' }
    it { is_expected.to include 'activity' }
    it { is_expected.to include 'position' }
    it { is_expected.to include 'security' }

    it { is_expected.to include '2015-01-13' }
    it { is_expected.to include '2015-01-14' }
    it { is_expected.to include '2015-01-23' }
  end
end
