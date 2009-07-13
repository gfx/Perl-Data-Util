#!perl -w

use strict;
use Test::More tests => 8;
use Test::Exception;

use Data::Util qw(get_code_info install_subroutine);

use Attribute::Handlers;
sub UNIVERSAL::Foo :ATTR(CODE, BEGIN){
	my($pkg, $sym, $subr) = @_;

	lives_ok{
		is_deeply [get_code_info($subr)], [], 'get_code_info()';
		is_deeply scalar(get_code_info($subr)), undef, 'get_code_info() in scalar context';
	};

	lives_ok{
		no warnings 'redefine';
		install_subroutine 'main', 'foo', $subr;
	} 'install_subroutine()';
}

sub f :Foo;

my $anon = sub :Foo {};
