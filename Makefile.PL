
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Minify, Compress, Cache-control and Serve static files from Plack applications",
  "AUTHOR" => "Ido Perlmuter <ido\@ido50.net>",
  "BUILD_REQUIRES" => {
    "Data::Dumper" => 0,
    "HTTP::Request" => 0,
    "Plack::Test" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Plack-App-MCCS",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Plack::App::MCCS",
  "PREREQ_PM" => {
    "Cwd" => 0,
    "Fcntl" => 0,
    "File::Spec::Unix" => 0,
    "HTTP::Date" => 0,
    "Module::Load::Conditional" => 0,
    "Plack::Component" => 0,
    "Plack::MIME" => 0,
    "Plack::Util" => 0,
    "Plack::Util::Accessor" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.004",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



