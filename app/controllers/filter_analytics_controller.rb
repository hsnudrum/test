class FilterAnalyticsController < InheritedResources::Base
  layout :resolve_layout


  def create

    @filter_analytic = FilterAnalytic.new(params[:filter_analytic])

    if @filter_analytic.blank? || (@filter_analytic.password != "exempt_from_feewise_ga")
      flash[:alert] = "Problem: Check you are using the correct password and caps lock is not on"
      render :action => :new and return
    end

    @filter_name = @filter_analytic.filter_name
    respond_to do |format|
      if @filter_analytic.save
        format.html { redirect_to @filter_analytic, notice: 'Filter_Analytic was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def show
    @filter_analytic = FilterAnalytic.find(params[:id])
    @filter_name = @filter_analytic.filter_name
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @filter_analytic }
    end
  end

private

  def resolve_layout
    case action_name
    when "show"
      "filter_analytics_layout"
    else
      "no_layout"
    end
  end

end
