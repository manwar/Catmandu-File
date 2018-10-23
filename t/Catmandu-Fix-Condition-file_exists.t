#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Test::Exception;
use Catmandu::Fix::set_field;

my $pkg;

BEGIN {
    $pkg = "Catmandu::Fix::Condition::file_exists";
    use_ok $pkg;

    system "touch t/test-file-exists.txt";
}

my $cond = $pkg->new("file");
$cond->pass_fixes([Catmandu::Fix::set_field->new("test", "pass")]);
$cond->fail_fixes([Catmandu::Fix::set_field->new("test", "fail")]);

is_deeply $cond->fix({}), {test => "fail"}, "no file path given";

is_deeply $cond->fix({file => undef}), {file => undef, test => "fail"},
    "file path undef";

is_deeply $cond->fix({file => "t/test-does-not-file-exist.txt"}),
    {file => "t/test-does-not-file-exist.txt", test => "fail"},
    "file does not exist";

is_deeply $cond->fix({file => "t/test-file-exists.txt"}),
    {file => "t/test-file-exists.txt", test => "pass"}, "file exists";

done_testing;

END {
    unlink "t/test-file-exists.txt";
}
