module GoogleChart
  # This module is used as a mixin for providing line parameter functionality for line-charts
  module LineParameter

    private
    def line_parameter(parameter)
      @line_parameters ||= []
      @line_parameters << parameter
    end

    def add_line_parameters
      @params[:chls] = @line_parameters.join("|") unless @line_parameters.empty?
    end
  end
end
