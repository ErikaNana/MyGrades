class AssignmentsController < ApplicationController
    def index
        #for some reason Assignment.select(:title).uniq modifies id params
        @assignments = Assignment.all
        #get unique assignments
        @assignments = @assignments.uniq{|x| x.title}
    end
    def create
        #check if params are empty 
        if params[:assignment].values.include?("") or params[:file] == nil
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
                redirect_to assignments_path
            end
        end
    end
    
    def show
        id = params[:id]
        @assignment = Assignment.find(id)
        @assignments = Assignment.where("title = ?", @assignment.title)
        #render default view
    end
    def new
        #renders the default view
    end
    def edit
        @assignment = Assignment.find(params[:id])
        #need to change all of the assignments with that title
    end
    def destroy
        @assignment = Assignment.find(params[:id])
        #delete all instances of this assignment
        @assignments = Assignment.where("title = ?", @assignment.title)
        @assignments.each do |assignment|
            assignment.destroy
        end
        redirect_to assignments_path
    end
    def update
        @assignment = Assignment.find(params[:id])
        @assignments = Assignment.where("title = ?", @assignment.title)
        if params[:file]
            #delete all assignments and make new ones
            @assignments.each do |assignment|
                assignment.destroy
            end
            #create new assignments from new params
            n = 0
            infile = params[:file].read
            CSV.parse(infile) do |row|
                n+=1
                #SKIP: header
                next if n == 1
                #build assignment from row in file
                assignment = Assignment.build_from_csv(row, params[:assignment])
            end
            @assignment = Assignment.find_by_title(params[:assignment][:title])
        else #just update assignment params
            @assignments.each do |assignment|
                assignment.update_attributes!(params[:assignment])
            end
        end
        redirect_to assignment_path(@assignment)
    end
end