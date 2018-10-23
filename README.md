# NAME

Catmandu::Fix::Condition::dir\_exists - only execute fixes if the directory exists

# SYNOPSIS

    # path => /var/log/errors
    if dir_exists(path)
      add_field(error, "some error occured")
    end

    # inverted
    # path => /var/log/errors
    unless dir_exists(path)
      add_field(no_error, "no error!")
    end

# AUTHOR

Vitali Peil <vitali.peil@uni-bielefeld.de>

# COPYRIGHT

Copyright 2018- Vitali Peil

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO

[Catmandu::Fix](https://metacpan.org/pod/Catmandu::Fix)
