class LanternfishSchool
    def initialize(input)
        @fish = parse(input)
    end

    def tick
        spawned_fish = []
        @fish = @fish.map do |timer|
            case timer
            when 0
                spawned_fish.push 8
                6
            else
                timer - 1
            end
        end
        @fish = @fish + spawned_fish
        self
    end

    def to_s
        @fish.join(",")
    end

    def size
        @fish.count
    end

    private

    def parse(input)
        input.split(",").map do |timer|
            timer.to_i
        end
    end
end

example = "3,4,3,1,2"
problem_input = File.read("input")

school = LanternfishSchool.new(problem_input)
80.times do
    school.tick
end
puts school.size
