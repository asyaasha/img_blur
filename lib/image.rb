class Image
  attr_accessor :data
  
  def initialize (data)
     @data = data
  end
  
  def output_image
    self.data.each do|inner|
      puts inner.join(" ")
    end
  end
  
  def blur
    indexes =[]
    self.data.each_with_index do |inner, rowIndex|
      inner.each_with_index do |number, columIndex|
        if number == 1
          indexes.push([rowIndex,columIndex])
        end
      end
    end
    indexes.each do |key, value|
      data[key-1][value] = 1 if key !=0
      data[key][value-1] = 1 if value !=0
      data[key+1][value] = 1 if key +1 != data.length 
      data[key][value+1] = 1 if value < data.length-1 
    end
     return self
  end

end
