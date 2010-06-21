module GoogleChart
  # This module is used as a mixin for providing Line Parameters
  module LineParameters

    private
    def line_parameters(parameters)
      @line_parameters ||= []
      @line_parameters << parameters
    end

    def add_line_parameters
      @params[:chls] = @line_parameters.join("|") unless @line_parameters.empty?
    end
  end
end
