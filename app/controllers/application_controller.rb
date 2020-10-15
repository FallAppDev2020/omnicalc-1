class ApplicationController < ActionController::Base
  layout ("wrapper.html.erb")

  def blank_square_form
    
    render ({ :template => "calculation_templates/square.html.erb"})
  end 

  def blank_square_root_form
    
    render ({ :template => "calculation_templates/square_root.html.erb"})
  end 

  def blank_payment_form
    
    render ({ :template => "calculation_templates/payment.html.erb"})
  end 

  def blank_random_form
    
    render ({ :template => "calculation_templates/randomgen.html.erb"})
  end 

  def calculate_square
    # params {"num2square"=>"42"}
    @num = params.fetch("num2square").to_f
    @square_num = @num * @num
    render ({ :template => "calculation_templates/calcsquare.html.erb"})
  end 

  def calculate_square_root
    @num = params.fetch("num2square").to_f
    @square_num = Math.sqrt(@num)
    render ({ :template => "calculation_templates/calcsquare_root.html.erb"})
  end 

  def caluculate_payment
    @apri = params.fetch("apr").to_f
    @yers = params.fetch("yrs").to_f
    @prin = params.fetch("pri").gsub(",","").to_f
    p @mpri = (@apri/1200)
    p @numi = @mpri*@prin
    p @yr = -12*@yers
    @pmnt = @numi / (1-(1+@apri/1200)**@yr)
    render ({ :template => "calculation_templates/calcpayment.html.erb"})
  end 

  def caluculate_random
    @mini = params.fetch("min").to_f
    @maxi = params.fetch("max").to_f
    @rnad = rand(@mini..@maxi)

    render ({ :template => "calculation_templates/calcrandom.html.erb"})
  end 
  
end
