class Answer
	include DataMapper::Resource
property :id, Serial
property :value, Text
property :abbrev, String
belongs_to :question
end
class Question
	include DataMapper::Resource
property :id, Serial
property :value, Text
property :correct_answer, String
has n, :answers
end
DataMapper.finalize.auto_upgrade!