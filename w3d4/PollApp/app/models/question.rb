class Question < ApplicationRecord
  validates :poll_id, :question_body, presence: true

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :responses,
    through: :answer_choices,
    source: :responses


  def bad_results
    results = {}
    answer_choices.each do |answer|
      results[answer.title] = answer.responses.count
    end
    results
  end

  def mediocre_results
    results = {}
    answer_assocations = answer_choices.include(:responses)
    answer_assocations.each do |answer|
      results[answer.title] = answer.responses.count
    end
    results
  end

  def good_results
    # <<-SQL
    #   SELECT
    #     answer_choices.*, COUNT(*) AS response_count
    #   FROM
    #     answer_choices
    #   JOIN
    #     responses ON responses.answer_choice_id = answer_choices.id
    #   JOIN
    #     questions ON answer_choices.question_id = questions.id
    #
    #   GROUP BY
    #     answer_choices.id
    #
    # SQL
  end

end
