RSpec.describe Status, type: :model do
  describe '#plants' do
    subject { Status.first.plants }

    it do
      expect(subject).to all(be_instance_of(Plant))
    end
  end

  describe '.dead' do
    subject { Status.dead }

    it do
      expect(subject).to be_instance_of(Status)
      expect(subject.name).to eql('Dead')
    end
  end

  describe '.alive' do
    subject { Status.alive }

    it do
      expect(subject).to be_instance_of(Status)
      expect(subject.name).to eql('Alive')
    end
  end
end