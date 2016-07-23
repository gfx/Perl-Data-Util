package builder::MyBuilder;
use strict;
use warnings;
use 5.008001;
use base 'Module::Build::XSUtil';

sub new {
    my ( $class, %args ) = @_;
    my $self = $class->SUPER::new(
        %args,
        c_source => 'xs-src',
        xs_files => {
            './xs-src/DataUtil.xs' => './lib/Data/Util.xs',
        },
        generate_ppport_h  => 'xs-src/ppport.h',
        generate_xshelper_h  => 'xs-src/xshelper.h',
        extra_compiler_flags => ['-Ixs-src', '-DINLINE_STR_EQ'],
        needs_compiler_c99 => 1,
    );
    return $self;
}

1;
