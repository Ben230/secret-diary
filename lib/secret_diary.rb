class SecretDiary
  def initialize
    @diarylog = []
    @locked = true
  end
  attr_reader :locked
  attr_reader :diarylog

  def add_entry(entry)
    fail 'diary is locked' if @locked
    @diarylog << entry
  end

  def get_entries
    fail 'diary is locked' if @locked
    @diarylog
  end

  def unlock
    @locked = false
  end

  def lock
    @locked = true
  end

end

# class SecretDiaryLock
#   def initialize
#     @locked = true
#   end
#   attr_reader :locked
#
#   def unlock
#     @locked = false
#   end
#
#   def lock
#     @locked = true
#   end
# end
#
# class SecretDiaryLog
#   def initialize
#     @diarylog = []
#   end
#   attr_reader :diarylog
#
#   def add_entry(entry)
#     fail 'diary is locked' if @locked
#     @diarylog << entry
#   end
#
#   def get_entries
#     fail 'diary is locked' if @locked
#     @diarylog
#   end
# end
