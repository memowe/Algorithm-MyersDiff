package Algorithm::MyersDiff::EditGrid;

use strict;
use warnings;
use feature 'signatures';
no warnings 'experimental::signatures';

use Class::Tiny qw(before after);

# Tells if two vertices in this grid are reachable directly.
# Expects vertices to be given as [x-coordinate, y-coordinate].
sub reachable ($self, $from, $to) {

    # Check lengths
    die "Illegal lengths\n"
        if $from->[0]   < 0
        or $from->[0]   > length $self->before
        or $from->[1]   < 0
        or $from->[1]   > length $self->after
        or $to->[0]     < 0
        or $to->[0]     > length $self->before
        or $to->[1]     < 0
        or $to->[1]     > length $self->after;

    # Check for monotone direction
    die "Direction not monotone:"
        . " ($from->[0],$from->[1]) -> ($to->[0],$to->[1])\n"
        if $from->[0] > $to->[0] or $from->[1] > $to->[1];

    # One to the right or one to the bottom
    return 1
        if $to->[0] == $from->[0] + 1 and $to->[1] == $from->[1]
        or $to->[1] == $from->[1] + 1 and $to->[0] == $from->[0];

    # Diagonally iff the two characters are the same
    my $before_to   = substr $self->before, $to->[0] - 1, 1;
    my $after_to    = substr $self->after,  $to->[1] - 1, 1;
    return 1
        if $to->[0] == $from->[0] + 1 and $to->[1] == $from->[1] + 1
        and $before_to eq $after_to;

    # Not reachable otherwise
    return;
}

1;
__END__
