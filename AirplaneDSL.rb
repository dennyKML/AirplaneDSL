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
    "Purpose: #{@purpose}\n" +
      "Weight Class: #{@weight_class}\n" +
      "Speed: #{@speed}\n" +
      "Landing Gear Type: #{@landing_gear_type}\n" +
      "Takeoff Type: #{@takeoff_type}\n" +
      "Thrust Source: #{@thrust_source}\n" +
      "Engine: #{@engine}"
  end

  def update(&block)
    instance_eval &block
    validate!
  end

  def self.compare(airplane1, airplane2)
    "\tComparing two airplanes:\n" +
      "Purpose: #{airplane1.purpose} vs #{airplane2.purpose}\n" +
      "Weight Class: #{airplane1.weight_class} vs #{airplane2.weight_class}\n" +
      "Speed: #{airplane1.speed} vs #{airplane2.speed}\n" +
      "Landing Gear Type: #{airplane1.landing_gear_type} vs #{airplane2.landing_gear_type}\n" +
      "Takeoff Type: #{airplane1.takeoff_type} vs #{airplane2.takeoff_type}\n" +
      "Thrust Source: #{airplane1.thrust_source} vs #{airplane2.thrust_source}\n" +
      "Engine: #{airplane1.engine} vs #{airplane2.engine}"
  end

  private

  def validate!
    raise "Invalid purpose!" unless VALID_PURPOSES.include?(@purpose)
    raise "Invalid weight class!" unless VALID_WEIGHT_CLASSES.include?(@weight_class)
    raise "Invalid speed!" unless VALID_SPEEDS.include?(@speed)
    raise "Invalid landing gear type!" unless VALID_LANDING_GEAR_TYPES.include?(@landing_gear_type)
    raise "Invalid takeoff type!" unless VALID_TAKEOFF_TYPES.include?(@takeoff_type)
    raise "Invalid thrust source!" unless VALID_THRUST_SOURCES.include?(@thrust_source)
    raise "Invalid engine!" unless VALID_ENGINES.include?(@engine)

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