require 'spec_helper'

describe Task, scope: true  do

  before { @task = Task.new(description: "first task ", project_id: "1") }

  subject { @task }

  it { should respond_to(:description) } 
  it { should respond_to(:project_id) }

  it { should be_valid }

  context "when description is not present" do
    before { @task.description = " " }
    it { should_not be_valid }
  end

    context "when description is already taken" do
    before do
      task_with_same_description = @task.dup
      task_with_same_description.description = @task.description.upcase
      task_with_same_description.save
    end
  end
end