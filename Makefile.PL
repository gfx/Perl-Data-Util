use strict;
use warnings;
use inc::Module::Install;

name 'Data-Util';

all_from 'lib/Data/Util.pm';

build_requires 'ExtUtils::ParseXS' => 2.19;

requires 'XSLoader'    => 0.06;
requires 'MRO::Compat' => 0.09  if $] < 5.010_000;

test_requires 'Test::More'      => 0.62;
test_requires 'Test::Exception' => 0.27;
test_requires 'Sub::Uplevel'; # in Test::Exception

test_requires 'Scope::Guard';

author_tests 'xt', 'author/t';

my $use_xs = can_cc();

for (@ARGV){
	/^-pp/ and $use_xs = 0;
	/^-xs/ and $use_xs = 1;
}

if($use_xs){
	makemaker_args(
		DEFINE => '-DINLINE_STR_EQ',
		OBJECT => '$(O_FILES)',
	);
	test_requires 'Hash::Util::FieldHash::Compat';
}
else{
	makemaker_args(
		XS => {},
		C  => [],
	);
	requires 'Hash::Util::FieldHash::Compat';
}

auto_set_repository;

WriteMakefile(
	clean => {
		FILES => q{
			Data-Util-*
			*.stackdump
			*.gcov *.gcda *.gcno
			*.out
			nytprof
			cover_db
		},
	},
);
