package Algorithm::MyersDiff::EditGrid;
use Mo qw(is required);

use strict;
use warnings;

has first   => (is => 'ro', required => 1);
has second  => (is => 'ro', required => 1);

# Tells if two vertices in this grid are reachable directly.
# Expects vertices to be given as [x-coordinate, y-coordinate].
sub reachable {
    my ($self, $from, $to) = @_;

    # Check lengths
    die "Illegal lengths\n"
        if $from->[0]   < 0
        or $from->[0]   > length $self->first
        or $from->[1]   < 0
        or $from->[1]   > length $self->second
        or $to->[0]     < 0
        or $to->[0]     > length $self->first
        or $to->[1]     < 0
        or $to->[1]     > length $self->second;

    # Check for monotone direction
    die "Direction not monotone:"
        . " ($from->[0],$from->[1]) -> ($to->[0],$to->[1])\n"
        if $from->[0] > $to->[0] or $from->[1] > $to->[1];

    # One to the right or one to the bottom
    return 1
        if $to->[0] == $from->[0] + 1 and $to->[1] == $from->[1]
        or $to->[1] == $from->[1] + 1 and $to->[0] == $from->[0];

    # Diagonally iff the two characters are the same
    my $first_to    = substr $self->first, $to->[0] - 1, 1;
    my $second_to   = substr $self->second, $to->[1] - 1, 1;
    return 1
        if $to->[0] == $from->[0] + 1 and $to->[1] == $from->[1] + 1
        and $first_to eq $second_to;

    # Not reachable otherwise
    return;
}

1;
__END__
