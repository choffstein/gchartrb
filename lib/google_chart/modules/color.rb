module GoogleChart
  # This module is used as a mixin for providing color functionality
  module Color
    private
    def color(color)
      @colors ||= []
      @colors << color
    end

    def add_colors
        if @chart_type == "s"
            @params[:chco] = @colors.flatten.compact.join("|") unless @colors.compact.empty?
        else
            @params[:chco] = @colors.flatten.compact.join(",") unless @colors.compact.empty?
        end
    end

  end
end
