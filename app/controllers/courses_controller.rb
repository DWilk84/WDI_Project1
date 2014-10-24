class CoursesController < ApplicationController

  authorize_resource
  
  # GET /courses
  # GET /courses.json
  def index
    @cities = Course.cities
    @courses = Course.all
    @upcoming_courses = Course.upcoming_courses
    @ongoing_courses = Course.ongoing_courses
    @completed_courses = Course.completed_courses

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    @admission = Admission.new()
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    # binding.pry
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    if Course.overlapping(params[:course]).any?
      flash[:error] = "Room is booked during proposed dates"

      redirect_to new_course_path
    else
      @course = Course.new(params[:course])
      @course.color = @course.program.color
      @course.code = @course.course_code(@course)

      respond_to do |format|
        if @course.save

          @course.booking = Booking.create(name: @course.code, classroom_id: @course.classroom.id, course_id: @course.id, start_at: @course.start_date, end_at: @course.end_date, color: @course.color)

          format.html { redirect_to @course, notice: 'Course was successfully created!' }
          format.json { render json: @course, status: :created, location: @course }
        else
          format.html { render action: "new" }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    end
    


  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])
    @course.color = @course.program.color
    @course.code = @course.course_code(@course)

    respond_to do |format|
      binding.pry
      if @course.update_attributes(params[:course])

       @course.booking.update_attributes(name: @course.code, classroom_id: @course.classroom.id, course_id: @course.id, start_at: @course.start_date, end_at: @course.end_date, color: @course.color)

       format.html { redirect_to @course, notice: 'Course was successfully updated!' }
       format.json { head :no_content }
     else
      format.html { render action: "edit" }
      format.json { render json: @course.errors, status: :unprocessable_entity }
    end
  end
end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  def apply_for_course

  end
end
