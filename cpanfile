requires 'perl', '5.10.1';
requires 'Moo';
requires 'namespace::clean';

# requires 'Some::Module', 'VERSION';

on test => sub {
    requires 'Test::More', '0.96';
    requires 'Test::Exception', '0.43';
    requires 'File::Path', '2.16';
};

requires 'Catmandu', '1.10';
