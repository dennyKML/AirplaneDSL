require_relative 'AirplaneDSL'

begin
  puts "Trying to create a new airplane..."

  airplane = Airplane.new do
    purpose 'Military'
    weight_class 1
    speed 'Hypersonic'
    landing_gear_type 'Land-based'
    takeoff_type 'Normal'
    thrust_source 'Jet'
    engine 'Turbojet'
  end

  puts airplane.info

  airplane.update do
    speed 'Supersonic'
  end

  puts "\nTrying to create one more new airplane..."
  airplane2 = Airplane.new do
    purpose 'Civilian'
    weight_class 2
    speed 'Subsonic'
    landing_gear_type 'Seaplanes'
    takeoff_type 'Normal'
    thrust_source 'Electric'
    # engine 'Turboprop'
  end

  puts airplane2.info

  puts Airplane.compare(airplane, airplane2)

  puts "Trying to create airplane with single attribute..."

  airplane3 = Airplane.new do
    purpose 'Civilian'
    engine 'Turbojet'
  end

  airplane4 = Airplane.new do
    purpose 'Military'
    engine 'Turbojet'
  end


  puts "\n\nFirst airplane with few attributes:"
  puts airplane3.info

  puts "\n\nSecond airplane with few attributes:"
  puts airplane4.info

  puts Airplane.compare(airplane3, airplane4)

rescue => e
  puts "Error: #{e.message}"
end