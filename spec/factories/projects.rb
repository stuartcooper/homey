FactoryBot.define do
  factory :project do
    name { 'Project Name' }
    status { Project::VALID_STATUSES.sample }
  end
end
