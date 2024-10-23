FactoryBot.define do
  factory :comment do
    body { 'A comment about my project' }
    project
  end
end
