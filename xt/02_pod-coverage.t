#!perl -w

use Test::More;
eval "use Test::Pod::Coverage 1.04";
plan skip_all => "Test::Pod::Coverage 1.04 required for testing POD coverage" if $@;

local $SIG{__WARN__} = sub{ 1 }; # not to concern about 'redefine' warnings
all_pod_coverage_ok({
	also_private => [qw(unimport regex_ref is_regex_ref)],
});
