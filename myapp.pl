#!/usr/bin/env perl
use warnings;
use strict;
use Data::Dumper;
use Mojolicious::Lite;

# Documentation browser under "/perldoc"
plugin 'PODRenderer';

get '/' => sub {
  my $self = shift;
  $self->stash('location' => "Pet ReFinder");
  $self->render(template => 'index', layout => 'base');
};

get '/at_home' => sub {
  my $self = shift;
  $self->stash('location' => "Around Home");
  $self->render(template => 'at_home', layout => 'base');
};

get '/nearby' => sub {
  my $self = shift;
  $self->stash('location' => "Neighborhood");
  $self->render(template => 'nearby', layout => 'base');
};

get '/launch' => sub {
  my $self = shift;

  $self->stash('location' => "Community");
  $self->render(template => 'launch', layout => 'base');
};

post '/launch' => sub {
  my $self = shift;

  my $picture = $self->param('picture');
  my $latitude = $self->param('latitude');
  my $longitude = $self->param('longitude');

  $self->app->log->debug("picture: $picture");
  $self->app->log->debug("latitude: $latitude");
  $self->app->log->debug("longitude: $longitude");

  $self->stash('location' => "Community");
  $self->render(template => 'launch', layout => 'base');
};

post '/nearby' => sub {
  my $self = shift;

  my $name = $self->param('name') || "your dog";
  my $motivation = $self->param('motivation');
  my $new_dogs = $self->param('new-dogs');
  my $new_people = $self->param('new-people');
  my $walks = $self->param('walks');
  my $when_called = $self->param('when-called');

  $self->session->{name} = $name;
  $self->session->{motivation} = $motivation;
  $self->session->{new_dogs} = $new_dogs;
  $self->session->{new_people} = $new_people;
  $self->session->{walks} = $walks;
  $self->session->{when_called} = $when_called;

  $self->app->log->debug("name: $name");
  $self->app->log->debug("motivation: $motivation");
  $self->app->log->debug("new dogs: $new_dogs");
  $self->app->log->debug("new people: $new_people");
  $self->app->log->debug("walks: $walks");
  $self->app->log->debug("when called: $when_called"); 

  $self->stash('name', $name);
  $self->stash('motivation', $motivation);
  $self->stash('new_dogs', $new_dogs);
  $self->stash('new_people', $new_people);
  $self->stash('walks', $walks);
  $self->stash('when_called', $when_called);
  $self->stash('location' => "Neighborhood");

  $self->render(template => 'plan', layout => 'base');
};

app->start;
