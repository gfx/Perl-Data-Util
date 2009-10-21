use strict;
use warnings;
use inc::Module::Install;

name 'Data-Util';

all_from 'lib/Data/Util.pm';

use_ppport 3.19;
cc_warnings;
requires 'MRO::Compat' => 0.09  if $] < 5.010_000;

test_requires 'Test::More'      => 0.62;
test_requires 'Test::Exception' => 0.27;

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

clean_files  q{
	Data-Util-*
	*.stackdump
	*.gcov *.gcda *.gcno
	*.out
	nytprof
	cover_db
};

WriteAll check_nmake => 0;

