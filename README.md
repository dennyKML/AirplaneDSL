# Airplane DSL Documentation

## Overview

This Domain Specific Language (DSL) is designed to facilitate the description of an airplane's design. It allows users to specify various characteristics and constraints of an airplane, ensuring that the combination of features is valid.

## Table of Contents

- [Classes](#classes)
- [Attributes](#attributes)
- [Methods](#methods)
- [Usage](#usage)
- [Examples](#examples)
- [Aircraft Classifications](#aircraft-classifications)
- [Validation](#validation)
- [Exceptions (Errors)](#exceptions-errors)
- [Comparing Airplanes](#comparing-airplanes)
- [Usage Example](#usage-example)

## Classes

### Airplane

The `Airplane` class represents an airplane and provides methods for describing its design.

## Attributes

- `purpose`: Purpose of the airplane ("Military", "Civilian").
- `weight_class`: Takeoff weight class of the airplane (1 to 4).
- `speed`: Flight speed category of the airplane ("Subsonic", "Supersonic", "Hypersonic").
- `landing_gear_type`: Type of landing gear ("Land-based", "Shipboard", "Seaplanes").
- `takeoff_type`: Type of takeoff and landing ("Vertical", "Short", "Normal").
- `thrust_source`: Source of thrust (engine type) ("Screw", "Jet", "Electric").
- `engine`: Type of engine ("Turbojet", "Turboprop", "Piston").

## Methods

- `initialize(&block)`: Initializes an airplane instance with a block to set attributes.
- `update(&block)`: Updates an existing airplane instance with a block.
- `info`: Returns a formatted string with the airplane's information.
- `self.compare(airplane1, airplane2)`: Compares two airplanes and returns a formatted string.

## Usage

Create an instance of the `Airplane` class, providing a block to set or update attributes.

```ruby
plane = Airplane.new do
  purpose 'Military'
  weight_class 2
  speed 'Supersonic'
  landing_gear_type 'Land-based'
  takeoff_type 'Vertical'
  thrust_source 'Jet'
  engine 'Turboprop'
end
```

## Examples

```ruby
# Creating a new airplane
plane = Airplane.new do
  purpose 'Civilian'
  weight_class 3
  speed 'Subsonic'
  landing_gear_type 'Land-based'
  takeoff_type 'Normal'
  thrust_source 'Screw'
  engine 'Turbojet'
end

puts plane.info
```

## Aircraft Classifications

The DSL recognizes the following aircraft classifications:

### By Purpose

- **Military**
- **Civilian**

### By Takeoff Weight

- **Class 1:** 75 tons and more
- **Class 2:** 30 to 75 tons
- **Class 3:** 10 to 30 tons
- **Class 4:** up to 10 tons

### By Flight Speed

- **Subsonic**
- **Supersonic**
- **Hypersonic**

### By Type of Landing Gear

- **Ground**
- **Shipboard**
- **Seaplanes**

### By Type of Takeoff and Landing

- **Vertical**
- **Short**
- **Normal**

### By Type of Thrust Source (Engine Type)

- **Screw**
- **Jet**
- **Electric**

## Validation

This DSL includes validation checks to ensure that the combination of attributes is valid. Invalid combinations will raise an exception with a descriptive error message.

## Exceptions (Errors)

1. **Invalid Purpose**: Raised if the specified purpose is not one of the valid purposes.
2. **Invalid Weight Class**: Raised if the specified weight class is not one of the valid weight classes.
3. **Invalid Speed**: Raised if the specified speed is not one of the valid speeds.
4. **Invalid Landing Gear Type**: Raised if the specified landing gear type is not one of the valid types.
5. **Invalid Takeoff Type**: Raised if the specified takeoff type is not one of the valid types.
6. **Invalid Thrust Source**: Raised if the specified thrust source is not one of the valid sources.
7. **Invalid Engine Type**: Raised if the specified engine type is not one of the valid types.
8. **Impossible Combinations**: Raised for specific combinations that are deemed impossible based on aircraft design standards.

## Comparing Airplanes

The `self.compare` method allows for a side-by-side comparison of two airplanes, highlighting the differences in their attributes.

```ruby
# Comparing two airplanes
plane1 = Airplane.new { purpose 'Civilian' }
plane2 = Airplane.new { purpose 'Military' }

puts Airplane.compare(plane1, plane2)
```

## Usage Example

An example of how to use this DSL ([example.rb](example.rb)):

```ruby
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
```