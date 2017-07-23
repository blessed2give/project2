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


my $stmt = qq(INSERT INTO PERSON (ID,FIRSTNAME,LASTNAME,HOME)
VALUES (1, 'Rose', 'Tyler', 'Earth' ));
my $rv = $dbh->do($stmt) or die $DBI::errstr;

$stmt = qq(INSERT INTO PERSON (ID,FIRSTNAME,LASTNAME,HOME)
VALUES (2, 'Zoe', 'Hariot', 'Space Station W3' ));
$rv = $dbh->do($stmt) or die $DBI::errstr;

$stmt = qq(INSERT INTO PERSON (ID,FIRSTNAME,LASTNAME,HOME)
VALUES (3, 'Jo', 'Grant', 'Earth' ));
$rv = $dbh->do($stmt) or die $DBI::errstr;

$stmt = qq(INSERT INTO PERSON (ID,FIRSTNAME,LASTNAME,HOME)
VALUES (4, 'Leela', null, 'Unspecified' ));
$rv = $dbh->do($stmt) or die $DBI::errstr;

$stmt = qq(INSERT INTO PERSON (ID,FIRSTNAME,LASTNAME,HOME)
VALUES (5, 'Romana', null, 'Gallifrey' ));
$rv = $dbh->do($stmt) or die $DBI::errstr;

$stmt = qq(INSERT INTO PERSON (ID,FIRSTNAME,LASTNAME,HOME)
VALUES (6, 'Clara', 'Oswald', 'Earth' ));
$rv = $dbh->do($stmt) or die $DBI::errstr;

$stmt = qq(INSERT INTO PERSON (ID,FIRSTNAME,LASTNAME,HOME)
VALUES (7, 'Adric', null, 'Alzarius' ));
$rv = $dbh->do($stmt) or die $DBI::errstr;

$stmt = qq(INSERT INTO PERSON (ID,FIRSTNAME,LASTNAME,HOME)
VALUES (8, 'Susan', 'Foreman', 'Gallifrey' ));
$rv = $dbh->do($stmt) or die $DBI::errstr;

print "Records created successfully\n";
$dbh->disconnect();
