require_relative 'AirplaneDSL'

begin
  puts "Trying to create a new airplane..."
  puts

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

  puts
  puts "Trying to create one more new airplane..."
  airplane2 = Airplane.new do
    purpose 'Civilian'
    weight_class 2
    speed 'Subsonic'
    landing_gear_type 'Seaplanes'
    takeoff_type 'Short'
    thrust_source 'Electric'
    engine 'Turboprop'
  end

  puts
  puts airplane2.info
  puts

  puts Airplane.compare(airplane, airplane2)
rescue => e
  puts "Error: #{e.message}"
end