#!/usr/bin/env ruby
require 'set'

class BoomerangSolution
  def initialize(inputfile)
    @inputfile = inputfile
    @totalcases = 0
    @current_case = 0
  end

  def solve
    current_case_max_points = 0
    points = []
    current_case_solution = 0

    File.open(@inputfile).each_with_index do |line, index|
      @totalcases = Integer(line.strip) and next if index == 0

      # case start
      if line.split(' ').length == 1
        current_case_max_points = Integer(line.strip)
        @current_case += 1
        # puts "start of case #{current_case_max_points} points"
      else
        points << line.strip.split(' ').map(&:to_i)
        # puts "added point #{points}"
        if points.length == current_case_max_points
          # puts "all points added"
          length_hash = {}
          point_counter_hash = Hash.new(0)

          while (points.length > 1)
            start = points.shift
            points.each do |p|
              segment_length = calc_length(start, p)
              # puts "length between #{start} and #{p} is #{segment_length}"
              length_hash["#{segment_length}"] ||= Set.new
              if length_hash["#{segment_length}"].include?(start)
                current_case_solution += (point_counter_hash["#{segment_length} #{start.join(' ')}"] >= 2 ? 2 : 1)
              end
              if length_hash["#{segment_length}"].include?(p)
                current_case_solution += (point_counter_hash["#{segment_length} #{p.join(' ')}"] >= 2 ? 2 : 1)
              end

                # puts "#{segment_length} #{length_hash["#{segment_length}"].inspect} includes #{start} or #{p} COUNT #{current_case_solution}"

              length_hash["#{segment_length}"] << start
              length_hash["#{segment_length}"] << p
              point_counter_hash["#{segment_length} #{start.join(' ')}"] += 1
              point_counter_hash["#{segment_length} #{p.join(' ')}"] += 1
            end
          end

          puts "Case ##{@current_case}: #{current_case_solution}"
          current_case_max_points = 0
          points = []
          current_case_solution = 0
        end
      end
    end
  end

  def calc_length(a, b)
    x1, y1 = a
    x2, y2 = b
    Math.sqrt((x1 - x2)**2 + (y1 - y2)**2)
  end
end

inputfile = ARGV.shift
solver = BoomerangSolution.new(inputfile)
solver.solve
