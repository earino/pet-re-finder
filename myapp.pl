#!/usr/bin/env perl
use warnings;
use strict;
use Data::Dumper;
use Mojolicious::Lite;

# Documentation browser under "/perldoc"
plugin 'PODRenderer';

get '/' => sub {
  my $self = shift;
  $self->render(template => 'index', layout => 'base');
};

get '/nearby' => sub {
  my $self = shift;
  $self->render(template => 'nearby', layout => 'base');
};

post '/nearby' => sub {
  my $self = shift;

  my $name = $self->param('name');
  my $motivation = $self->param('motivation');
  my $new_dogs = $self->param('new-dogs');
  my $new_people = $self->param('new-people');
  my $walks = $self->param('walks');
  my $when_called = $self->param('when-called');

  $self->app->log->debug("name: $name");
  $self->app->log->debug("motivation: $motivation");
  $self->app->log->debug("new dogs: $new_dogs");
  $self->app->log->debug("new people: $new_people");
  $self->app->log->debug("walks: $walks");
  $self->app->log->debug("when called: $when_called"); 

  $self->stash('name', $name || "your dog");
  $self->stash('motivation', $motivation);
  $self->stash('new_dogs', $new_dogs);
  $self->stash('new_people', $new_people);
  $self->stash('walks', $walks);
  $self->stash('when_called', $when_called);

  $self->render(template => 'plan', layout => 'base');
};

app->start;
