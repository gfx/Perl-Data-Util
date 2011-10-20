use strict;
use warnings;
use inc::Module::Install    1.04;
use Module::Install::XSUtil 0.41;

all_from 'lib/Data/Util.pm';

requires 'MRO::Compat' => 0.09  if $] < 5.010_000;

test_requires 'Test::More'      => 0.62;
test_requires 'Test::Exception' => 0.27;
test_requires 'Scope::Guard';
test_requires 'Hash::Util::FieldHash::Compat';

author_tests 'xt', 'author/t';

if(want_xs()){
    use_xshelper;
    cc_warnings;
    cc_define '-DINLINE_STR_EQ';
}
else{
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

