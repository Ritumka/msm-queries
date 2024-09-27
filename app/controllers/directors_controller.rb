class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list" })
  end


  def youngest

    @youngest_dob  = Director.where({ :name => ("A".."Z") }).maximum(:dob)
    
    youngest = Director.where({ :dob => @youngest_dob })
    @youngest_id = youngest.at(0).id
    @youngest_name = youngest.at(0).name

    render({ :template => "director_templates/youngest" })
  end

  def eldest

    @eldest_dob  = Director.where({ :name => ("A".."Z") }).minimum(:dob)
    
    eldest = Director.where({ :dob => @eldest_dob })
    @eldest_id = eldest.at(0).id
    @eldest_name = eldest.at(0).name
    
    render({ :template => "director_templates/eldest" })
  end


  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id })

    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details" })
  end


end
