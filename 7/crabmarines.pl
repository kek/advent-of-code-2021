use strict;
use warnings;
use List::Util qw(max);

my $input = <>;
chomp($input);
my @crabs = split /,/, $input;

sub movement_cost {
    my ($distance) = @_;
    my $cost = 0;
    my $delta_cost = 1;
    foreach (1..$distance) {
        $cost += $delta_cost;
        $delta_cost += 1;
    }
    return $cost;
}

sub crab_alignment_cost {
    my ($starting_height, $ending_height) = @_;
    my $diff = abs($starting_height - $ending_height);
    my $result = movement_cost($diff);
    return $result;
}

sub crabs_alignment_cost {
    my ($desired_height) = @_;
    my $result = 0;
    foreach (@crabs) {
        $result += crab_alignment_cost($_, $desired_height);
    }
    return $result;
}

sub find_lowest_fuel_cost {
    my $best_cost = crabs_alignment_cost($crabs[0]);
    my $max = max(@crabs);
    print "max crab is $max\n";
    foreach(1 .. max(@crabs)) {
        my $candidate = $_;
        my $candidate_cost = crabs_alignment_cost($candidate);
        print("Cost for $candidate: $candidate_cost\n");
        if ($candidate_cost < $best_cost) {
            $best_cost = $candidate_cost;
            print("Found best cost so far\n");
        }
    }
    return $best_cost;
}

print find_lowest_fuel_cost();
