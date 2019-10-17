require 'secret_diary'

describe SecretDiary do
  #let(:unlocked_diary) { subject.unlock}
  it 'starts locked' do
    expect(subject.locked).to eq true
  end

  describe '#add_entry' do
    it 'always returns errors when locked at any point' do
      diary = SecretDiary.new
      diary.unlock
      diary.lock
      expect { subject.add_entry("test entry") }.to raise_error 'diary is locked'
    end

    it 'adds an entry to diary' do
      diary = SecretDiary.new
      diary.unlock
      diary.add_entry("test entry")
      expect(diary.diarylog[0]).to eq "test entry"
    end
  end

  describe '#get_entries' do
    it 'cant get entries when diary is locked at any point' do
      diary = SecretDiary.new
      diary.unlock
      diary.lock
      expect { subject.get_entries }.to raise_error 'diary is locked'
    end

    it 'shows the entries of diary' do
      diary = SecretDiary.new
      diary.unlock
      diary.add_entry("test 1")
      diary.add_entry("test 2")
      expect(diary.get_entries).to eq ["test 1", "test 2"]
    end
  end

  describe '#unlock' do
    it 'unlocks the diary' do
      diary = SecretDiary.new
      diary.unlock
      expect(diary.locked).to eq false
    end
  end

  describe '#lock' do
    it 'locks the diary' do
      diary = SecretDiary.new
      diary.unlock
      expect(diary.lock).to eq true
    end
  end

end
