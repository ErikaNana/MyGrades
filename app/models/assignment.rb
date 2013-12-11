class Assignment < ActiveRecord::Base
    attr_accessible :title #list of fields that you want to be accessible
    attr_accessible :description
    attr_accessible :user_id
    attr_accessible :grade
    attr_accessible :due_date

    def self.build_from_csv(row, params)
        row.compact! #take out nil values, figure out why they were there later
        @assignment = Assignment.create!(:title => params[:title], :description => params[:description],
                           :user_id => row[0], :grade => row[1]);
        raise @assignment.inspect
        #find existing user from UH id or create new
    end
end