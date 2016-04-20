use strict;
use warnings;

use Data::Dumper;
use Getopt::Long;


my %opts = (
        channels_conf => '~/w_scan_data/channels_b.conf',
        outdir => '/export/media/video/record/',
);
GetOptions(
	't=s' => \$opts{time},
	's=s' => \$opts{station},
	'd=i' => \$opts{duration},
	'f=s' => \$opts{file},
);



if( scalar( grep {$_} values %opts ) != 6 ) {
	die "insufficient params:".Dumper(%opts);
}


my $line = `grep -i $opts{station} $opts{channels_conf}`
	or die "unknown station '$opts{station}'";
chop($line);
my %chan;
{
	no warnings 'uninitialized';
	@chan{ 'name','freq',undef,'bw',undef,undef,undef,undef,undef,undef,undef,undef,'program'  } = split /:/,$line; 
}
#die Dumper \%chan;

$opts{duration} *= 60;
my $cmd = "cvlc --run-time=$opts{duration} --play-and-exit --sout='$opts{outdir}$opts{file}' dvb-t:// :dvb-frequency=$chan{freq} :dvb-bandwidth=8 :program=$chan{program}";
#print "$cmd\n";
`echo "$cmd" |at -t $opts{time}`;
