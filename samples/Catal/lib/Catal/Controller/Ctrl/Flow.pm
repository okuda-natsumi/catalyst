package Catal::Controller::Ctrl::Flow;

use strict;
use warnings;
use parent 'Catalyst::Controller';

=head1 NAME

Catal::Controller::Ctrl::Flow - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched Catal::Controller::Ctrl::Flow in Ctrl::Flow.');
}

sub forward_from :Local {
	my ( $self, $c ) = @_;
  my $result = $c->forward('/ctrl/flow/forward_to', [2, 4]);
	#my @result =$c->forward('/ctrl/flow/forward_to', [2, 4]);
	#my $result =$c->forward('Catal::Controller::Ctrl::Flow',
	#	'forward_to', [2, 4]);
  $c->response->body('三角形：' . $result->[0]. '／' .
    '四角形：' . $result->[1]);
  #$c->response->body('三角形：' . $result[0]. '／' .
  #  '四角形：' . $result[1]);
}

sub forward_to :Private {
	my ( $self, $c, $base, $height ) = @_;
  return [ $base * $height / 2, $base * $height ];
  #my @result = ( $base * $height / 2, $base * $height );
	#return @result;
}

sub visit_from :Local {
	my ( $self, $c ) = @_;
	$c->visit('/ctrl/flow/visit_to');
}

sub visit_to :Private {
	my ( $self, $c ) = @_;
	$c->response->body('正常に動作しています。');
}

sub begin :Private {}

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
