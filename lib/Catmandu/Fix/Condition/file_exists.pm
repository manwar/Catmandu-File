package Catmandu::Fix::Condition::file_exists;

our $VERSION = '0.01';

use Catmandu::Sane;
use Moo;
use namespace::clean;
use Catmandu::Fix::Has;

has path => (fix_arg => 1);

with 'Catmandu::Fix::Condition::SimpleAllTest';

sub emit_test {
    my ($self, $val) = @_;
    "defined(${val}) && -f (${val})";
}

1;

__END__

=pod

=head1 NAME

Catmandu::Fix::Condition::file_exists - only execute fixes if the file exists

=head1 SYNOPSIS

   # path => /var/log/apache/error.log
   if file_exists(path)
     add_field(error, "apache error!")
   end
   
   # inverted
   # path => /var/log/apache/error.log
   unless file_exists(path)
     add_field(no_error, "no error!")
   end

=head1 AUTHOR

Vitali Peil E<lt>vitali.peil@uni-bielefeld.deE<gt>

=head1 COPYRIGHT

Copyright 2018- Vitali Peil

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Catmandu::Fix>

=cut


1;
