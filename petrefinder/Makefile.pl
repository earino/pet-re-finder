use ExtUtils::MakeMaker;
WriteMakefile(
  NAME            => "My Plugin's Display Name",
  VERSION         => '1.1',
  DISTNAME        => 'MyPlugin',
  PREREQ_PM => {
    'Mojolicious' => 0,
    'Plack'      => 0.9974,
  },
);
