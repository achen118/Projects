class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
  validate :not_duplicate_response
  validate :no_cheating_authors

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question

  # has_one :poll,
  #   through: :question,
  #   source: :poll

  def sibling_responses
    self
      .question
      .responses
      .where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  def not_duplicate_response
    raise "Respondent already answered" if respondent_already_answered?
  end

  def cheating_author?
    self.question.poll.author_id == self.user_id
  end

  def no_cheating_authors
    raise "Author can't respond to own poll" if cheating_author?
  end

end
