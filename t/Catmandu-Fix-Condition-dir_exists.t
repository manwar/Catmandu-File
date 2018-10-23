#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Test::Exception;
use Catmandu::Fix::set_field;
use File::Path qw(make_path remove_tree);

my $pkg;

BEGIN {
    $pkg = "Catmandu::Fix::Condition::dir_exists";
    use_ok $pkg;

    make_path "t/testdir/doesexist";
}

my $cond = $pkg->new("dir");
$cond->pass_fixes([Catmandu::Fix::set_field->new("test", "pass")]);
$cond->fail_fixes([Catmandu::Fix::set_field->new("test", "fail")]);

is_deeply $cond->fix({}), {test => "fail"}, "no directory path given";

is_deeply $cond->fix({dir => undef}), {dir => undef, test => "fail"},
    "dir path undef";

is_deeply $cond->fix({dir => "t/testdir-does-not-exist"}),
    {dir => "t/testdir-does-not-exist", test => "fail"},
    "directory does not exist";

is_deeply $cond->fix({dir => "t/testdir"}),
    {dir => "t/testdir", test => "pass"}, "directory exists";

is_deeply $cond->fix({dir => "t/testdir/doesexist"}),
    {dir => "t/testdir/doesexist", test => "pass"},
    "directory exists, deep check";

done_testing;

END {
    remove_tree "t/testdir";
}
