m = Module.new do
  def columns_list
    column_names.collect { |c| "#{table_name}.#{c}" }.join(",")
  end
end

ActiveRecord::Base.send :extend, m
