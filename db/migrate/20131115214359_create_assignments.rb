class CreateAssignments < ActiveRecord::Migration
  def up
    create_table 'assignments' do |t|
        t.string 'title'
        t.string 'description'
        t.string 'user_id'
        t.string 'grade'
        t.string 'due_date'
    end
  end

  def down
    drop_table 'assignments' #deletes the whole table
  end
end
