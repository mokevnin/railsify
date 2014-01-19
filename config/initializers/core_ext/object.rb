class Object
  def mix(name, &block)
    class_eval &block
  end
end
