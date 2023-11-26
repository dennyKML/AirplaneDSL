class Airplane
  VALID_PURPOSES = %w[Military Civilian]
  VALID_WEIGHT_CLASSES = [1, 2, 3, 4]
  VALID_SPEEDS = %w[Subsonic Supersonic Hypersonic]
  VALID_LANDING_GEAR_TYPES = %w[Land-based Shipboard Seaplanes]
  VALID_TAKEOFF_TYPES = %w[Vertical Short Normal]
  VALID_THRUST_SOURCES = %w[Screw Jet Electric]
  VALID_ENGINES = %w[Turbojet Turboprop Piston]

  attr_accessor :purpose, :weight_class, :speed, :landing_gear_type, :takeoff_type, :thrust_source, :engine

  def initialize(&block)
    if block_given?
      instance_eval &block
      validate!
    else
      raise "There is no block was given!"
    end
  end

  def purpose(value=nil)
    if value
      @purpose = value
    else
      @purpose
    end
  end

  def weight_class(value=nil)
    if value
      @weight_class = value
    else
      @weight_class
    end
  end

  def speed(value=nil)
    if value
      @speed = value
    else
      @speed
    end
  end

  def landing_gear_type(value=nil)
    if value
      @landing_gear_type = value
    else
      @landing_gear_type
    end
  end

  def takeoff_type(value=nil)
    if value
      @takeoff_type = value
    else
      @takeoff_type
    end
  end

  def thrust_source(value=nil)
    if value
      @thrust_source = value
    else
      @thrust_source
    end
  end

  def engine(value=nil)
    if value
      @engine = value
    else
      @engine
    end
  end

  def info
    info = ""
    info += "\nPurpose: #{@purpose}" if @purpose
    info += "\nWeight Class: #{@weight_class}" if @weight_class
    info += "\nSpeed: #{@speed}" if @speed
    info += "\nLanding Gear Type: #{@landing_gear_type}" if @landing_gear_type
    info += "\nTakeoff Type: #{@takeoff_type}" if @takeoff_type
    info += "\nThrust Source: #{@thrust_source}" if @thrust_source
    info += "\nEngine: #{@engine}" if @engine
    info
  end

  def update(&block)
    instance_eval &block
    validate!
  end

  def self.compare(airplane1, airplane2)
    comparison = "\n\tComparing two airplanes:\n"
    comparison += compare_attribute("Purpose", airplane1.purpose, airplane2.purpose)
    comparison += compare_attribute("Weight Class", airplane1.weight_class, airplane2.weight_class)
    comparison += compare_attribute("Speed", airplane1.speed, airplane2.speed)
    comparison += compare_attribute("Landing Gear Type", airplane1.landing_gear_type, airplane2.landing_gear_type)
    comparison += compare_attribute("Takeoff Type", airplane1.takeoff_type, airplane2.takeoff_type)
    comparison += compare_attribute("Thrust Source", airplane1.thrust_source, airplane2.thrust_source)
    comparison += compare_attribute("Engine", airplane1.engine, airplane2.engine)
    comparison
  end

  private

  def self.compare_attribute(attribute_name, value1, value2)
    if value1 || value2
      value1 ||= "'undefined'"
      value2 ||= "'undefined'"

      if value1 != value2
        comparison = "#{attribute_name}:\e[33m #{value1} vs #{value2}\n\e[0m" # ANSI escape sequence '\e[33m' (start yellow color) and ''\e[0m' (reset color)
      else
        comparison = "#{attribute_name}: #{value1} vs #{value2}\n"
      end
    else
      comparison = ""
    end

    comparison
  end

  def validate!
    raise "Invalid purpose!" if @purpose && !VALID_PURPOSES.include?(@purpose)
    raise "Invalid weight class!" if @weight_class && !VALID_WEIGHT_CLASSES.include?(@weight_class)
    raise "Invalid speed!" if @speed && !VALID_SPEEDS.include?(@speed)
    raise "Invalid landing gear type!" if @landing_gear_type && !VALID_LANDING_GEAR_TYPES.include?(@landing_gear_type)
    raise "Invalid takeoff type!" if @takeoff_type && !VALID_TAKEOFF_TYPES.include?(@takeoff_type)
    raise "Invalid thrust source!" if @thrust_source && !VALID_THRUST_SOURCES.include?(@thrust_source)
    raise "Invalid engine!" if @engine && !VALID_ENGINES.include?(@engine)

    if @weight_class == 1 && @speed == 'Hypersonic' && @takeoff_type == 'Vertical' && @engine == 'Turboprop'
      raise "Impossible combination: Class 1, Hypersonic, Vertical takeoff, Turboprop engine"
    end

    if @weight_class == 1 && @landing_gear_type == 'Seaplanes' && @takeoff_type == 'Vertical' && @engine == 'Piston'
      raise "Impossible combination: Class 1, Seaplanes, Vertical takeoff, Piston engine"
    end

    if @weight_class == 4 && @speed == 'Hypersonic' && @engine == 'Piston'
      raise "Impossible combination: Class 4, Hypersonic, Piston engine"
    end

    if @weight_class == 1 && @speed == 'Supersonic' && @landing_gear_type == 'Seaplanes' && @engine == 'Piston'
      raise "Impossible combination: Class 1, Supersonic, Seaplanes, Piston engine"
    end

    if @weight_class == 4 && @purpose == 'Military' && @landing_gear_type == 'Shipboard' && @speed == 'Hypersonic' && @engine == 'Turboprop'
      raise "Impossible combination: Class 4, Military, Shipboard, Hypersonic, Turboprop engine"
    end

  end
end