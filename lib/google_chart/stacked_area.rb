module GoogleChart
    class StackedArea < Base
      include Legend
      include Color
      include LineParameter
      include DataArray
      include Fills
      include Axis
      include Grid
      include Markers

      data_type :numeric

        def initialize(options={})
          @chart_type="lc"
          @show_legend = false
          super(options)
        end

        def data(legend, data, color)
          @area_colors ||= []
          @data_length ||= data.length
          raise ArgumentError.new("Data must be of same length") unless @data_length == data.length

          # "stack" the data on old data
          @data_length.times { |i|
            data[i] += @data[-1][i]
          } unless @data.length == 0

          @data << data
          legend(legend)
          color(color)
          @area_colors << color
        end
        
        private
        def encode_data
          total_entries = @data.size
          
          @data_length.times { |i|
            # re-format the data

            local_max = @data[total_entries-1][i].to_f

            total_entries.times { |j|
              @data[j][i] = @data[j][i].to_f / local_max 
            }
          }

          # This will overwrite each data line with black
          @data.clone.each { |a|
            @data << a # copy each element to the back of data again
            color("000000") #give it a black color
          }

          # add our min to the front
          @data.unshift(Array.new(@data_length, 0.0))
          
          @params[:chm] ||= []
          @area_colors.size.times { |i|
            @params[:chm] << "b,#{@area_colors[i]},#{i},#{i+1},0"
          }
          @params[:chm] = @params[:chm].join('|')
          super
        end
    end
end
