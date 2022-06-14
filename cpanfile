requires 'XSLoader', '0.02';
requires 'perl', '5.010';

requires 'Hash::Util::FieldHash::Compat';

on build => sub {
    requires 'Devel::PPPort', '3.19';
};

on configure => sub {
    requires 'Module::Build::XSUtil' => '>=0.02';
};

on test => sub {
    requires 'Test::Exception', '0.27';
    requires 'Test::More', '0.62';
    requires 'Scope::Guard';
};
