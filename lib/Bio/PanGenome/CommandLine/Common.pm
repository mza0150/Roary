package Bio::PanGenome::CommandLine::Common;
# ABSTRACT: Common command line settings

=head1 SYNOPSIS

Common command line settings

   extends 'Bio::PanGenome::CommandLine::Common';

=cut

use Moose;
use FindBin;

# add our included binaries to the END of the PATH
before 'run' => sub {
	my ($self) = @_;
	my $OPSYS = $^O;
	my $BINDIR = "$FindBin::RealBin/../binaries/$OPSYS";

    for my $dir ($BINDIR, "$BINDIR/../common", $FindBin::RealBin) {
      if (-d $dir) {
        $ENV{PATH} .= ":$dir";
       }
  }
};

no Moose;
1;