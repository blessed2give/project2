#!/usr/bin/perl

use DBI;
use strict;

my $driver   = "SQLite";
my $database = "table_data.db";
my $dsn = "DBI:$driver:dbname = $database";
my $userid = "";
my $password = "";
my $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 })
or die $DBI::errstr;

print "Opened database successfully\n";


my $stmt = qq(SELECT id, firstname, lastname, home from PERSON;);
my $sth = $dbh->prepare( $stmt );
my $rv = $sth->execute() or die $DBI::errstr;

if($rv < 0) {
    print $DBI::errstr;
}

while(my @row = $sth->fetchrow_array()) {
    print "ID = ". $row[0] . "\n";
    print "FIRSTNAME = ". $row[1] ."\n";
    print "LASTNAME = ". $row[2] ."\n";
    print "HOME =  ". $row[3] ."\n\n";
}
print "Operation done successfully\n";
$dbh->disconnect();
