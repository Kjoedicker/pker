#!/usr/bin/perl

use v5.30.3;
use strict; 
use warnings;  

use Term::ANSIColor;
print color('bold red');

sub matchPID {
    chomp(my ($process) = @_);

    my ($processPID) = $process =~ /(\d+)/;

    die "Cannot match PID" unless $processPID;

    return $processPID; 
}

sub killPID {
    my $PID = shift;

    say "Killing PID - $PID";

    my $result = `kill $PID`;

    return $result;
}

chomp(my $chosen_process = `ps | fzf`);

my $target_pid = matchPID($chosen_process);
my $kill_results = killPID($target_pid);