#!perl -w
package Person;
use Data::Util qw/:all/;
 
{
    my $method = modify_subroutine(
        get_code_ref(__PACKAGE__, 'chk'),
        after => [ sub { eval "use No::Such::Module::Hoge"; } ]
    );
    no warnings 'redefine';
    install_subroutine(__PACKAGE__, 'chk' => $method);
}
 
sub new {
    bless {}, shift;
}
 
sub chk {
    return 'checked';
}
 
package main;
use strict;
use warnings;
use Test::More tests => 1;
 
my $pp = Person->new;
is $pp->chk, 'checked', 'done check';
