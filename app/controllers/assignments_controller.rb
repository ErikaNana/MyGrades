class AssignmentsController < ApplicationController
    def index
        @assignments = Assignment.all
    end
    def create
        #check if params are empty
        if params[:assignment].values.include?("")
            flash[:warning] = "Please fill in all fields"
            redirect_to :back
        else
            n = 0
            infile = params[:file].read
            CSV.parse(infile) do |row|
                n+=1
                #SKIP: header
                next if n == 1
                #build assignment from row in file
                assignment = Assignment.build_from_csv(row, params[:assignment])
            end
            redirect_to assignments_path
        end
    end
    def show
        id = params[:id]
        @assignment = Assignment.find(id)
        #render default view
    end
    def new
        #renders the default view
    end
    def edit
        @assignment = Assignment.find(params[:id])
    end
    def destroy
        @assignment = Assignment.find(params[:id])
        @assignment.destroy
        redirect_to assignments_path
    end
    def update
        raise
    end
end