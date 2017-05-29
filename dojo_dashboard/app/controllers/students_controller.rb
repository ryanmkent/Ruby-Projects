class StudentsController < ApplicationController

  def show
    
    if Student.find(params[:studentid])   
       @student = Student.find(params[:studentid])
       @cohort = @student.dojo.students.order(:created_at)
       @dojo = Dojo.find(params[:dojoid])
       render 'show_student'
    elsif !@student
      redirect_to '/dojos/' + dojo.id.to_s
    end
  end

  def new_student
    @dojo = Dojo.find_by_id(params[:dojoid])
    render 'new_student'
  end

  def create_student
    @student = Student.create(first_name:params[:first_name],last_name:params[:last_name],email:params[:email])
    @student.save
    @dojo = Dojo.find(params[:id])
    redirect_to '/dojos/' + dojo.id.to_s
  end

  def destroy_student
    @dojo = Dojo.find(params[:dojoid])
    @student = Student.find(params[:studentid])
    @student.destroy
    redirect_to '/dojos/' + @dojo.id.to_s
  end

  def edit_student
    @student = Student.find(params[:studentid])
    @dojo = Dojo.find(params[:dojoid])
  end

  def update_student
    @dojo = Dojo.find(params[:dojoid])
    @student = Student.find(params[:studentid])
    @student.first_name = params[:new_first_name]
    @student.last_name = params[:new_last_name]
    @student.email = params[:new_email]
    @student.save
    redirect_to '/dojos/'+ @dojo.id.to_s
  end

end
