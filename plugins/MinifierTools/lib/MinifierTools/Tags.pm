package MinifierTools::Tags;

use strict;
use HTML::Clean;

sub _filter_minify {
    my ( $str, $arg, $ctx ) = @_;
    my $p = MT->component('MinifierTools');
    my $scope = 'blog:' . $ctx->stash("blog_id");
    if ( $arg == "html" ) {
        my $h = HTML::Clean->new(\$str);
        my %options = (
            whitespace => $p->get_config_value( 'whitespace', $scope ),
            shortertags => $p->get_config_value( 'shortertags', $scope ),
            blink => $p->get_config_value( 'blink', $scope ),
            contenttype => $p->get_config_value( 'contenttype', $scope ),
            comments => $p->get_config_value( 'comments', $scope ),
            entities => $p->get_config_value( 'entities', $scope ),
            dequote => $p->get_config_value( 'dequote', $scope ),
            defcolor => $p->get_config_value( 'defcolor', $scope ),
            javascript => $p->get_config_value( 'javascript', $scope ),
            htmldefaults => $p->get_config_value( 'htmldefaults', $scope ),
            lowercasetags => $p->get_config_value( 'lowercasetags', $scope )
        );
        $h->strip(\%options);
        my $data = $h->data();
        return $$data;
    }
}

1;