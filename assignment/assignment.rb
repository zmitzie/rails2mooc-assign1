require_relative '../config/environment'

# Use Active Record Model methods to implement the following methods.
class Assignment

  #
  # Insert rows in DB
  #
  def create_user(params)
    User.create(:username => params[:username],
                  :password_digest => params[:password_digest])
  end

  def create_todolist(params)
    TodoList.create(:list_name => params[:name],
                  :list_due_date => params[:due_date])
  end

  #
  # Retrieve paginated results from DB
  #
  def find_allusers(offset, limit)
    User.all.offset(offset).limit(limit).order(updated_at: :asc)
  end

  def find_alllists(offset, limit)
    TodoList.all.offset(offset).limit(limit).order(list_due_date: :desc)
  end

  #
  # Query DB with exact match
  #
  def find_user_byname(username)
    User.all.where(username: username)
  end 

  def find_todolist_byname(name)
    TodoList.all.where(list_name: name)
  end     

  #
  # Get rows from DB by PK
  #
  def get_user_byid(id)
    User.find_by(id: id)
  end

  def get_todolist_byid(id)
    TodoList.find_by(id: id)
  end

  #
  # Update rows in DB
  #
  def update_password(id, password_digest)
    User.find_by(id: id).update(:password_digest => password_digest)
  end

  def update_listname(id, name)
    TodoList.find_by(id: id).update(:list_name => name)
  end 

  #
  # Delete rows from DB
  #
  def delete_user(id)
    User.find_by(id: id).destroy
  end 

  def delete_todolist(id)
    TodoList.find_by(id: id).destroy
  end
end
