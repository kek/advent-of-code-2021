class LanternfishSchool
    def initialize(input)
        fish = parse(input)
        @fish = Array.new(9, 0)
        fish.each do |timer|
            @fish[timer] += 1
        end
    end

    def tick
        fisk = Array.new(9, 0)
        (0..7).each do |timer|
            fisk[timer] = @fish[timer + 1]
        end
        fisk[8] = @fish[0]
        fisk[6] += @fish[0]

        @fish = fisk
        self
    end

    def to_s
        @fish.join(",")
    end

    def size
        @fish.sum
    end

    private

    def parse(input)
        input.split(",").map do |timer|
            timer.to_i
        end
    end
end

class LanternfishSchoolCalculator
    def initialize(input, days)
        @school = LanternfishSchool.new(input)
        @days = days
    end

    def run
        @days.times do
            @school.tick
        end
        puts "Size after #{@days} days: #{@school.size}"
    end
end

example = "3,4,3,1,2"
problem_input = File.read("input")

LanternfishSchoolCalculator.new(example, 256).run
LanternfishSchoolCalculator.new(problem_input, 256).run
