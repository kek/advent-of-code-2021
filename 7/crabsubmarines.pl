use Data::Dumper qw(Dumper);
use strict;
use warnings;
use List::Util qw(max);

my $real_input = <>;
chomp($real_input);
my @crabs = split /,/, $real_input;

# my $example_input = "16,1,2,0,4,2,7,1,2,14";
# my @crabs = split /,/, $example_input;

# print Dumper \@crabs;

sub crab_alignment_cost {
    my ($starting_height, $ending_height) = @_;
    my $result = abs($starting_height - $ending_height);
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
        if ($candidate_cost < $best_cost) {
            $best_cost = $candidate_cost;
        }
    }
    return $best_cost;
}

print find_lowest_fuel_cost();
