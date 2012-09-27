use strict;
use warnings;
use utf8;

package SM::Controller::Storage;

use base "Catalyst::Example::Controller::InstantCRUDStylish";


# Generated automatically with HTML::FormHandler::Generator::DBIC
# Using following commandline:
# form_generator.pl --rs_name=Storage --schema_name= --class_prefix=SM::Controller::Storage --db_dsn=
{
    package SM::Controller::Storage::StorageForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    use namespace::autoclean;


    has '+item_class' => ( default => 'Storage' );

    has_field 'name' => ( type => 'Text', size => 45, required => 1, );
    has_field 'cat_storage_model' => ( type => 'Select', );
    # has_field 'luns' => ( type => '+SM::Controller::Storage::LunField', );
    has_field 'cat_location' => ( type => 'Select', );
    has_field 'cat_site' => ( type => 'Select', );
    has_field 'ip_addr_1' => ( type => 'Text', size => 45, );
    has_field 'ip_addr_2' => ( type => 'Text', size => 45, );
    has_field 'submit' => ( widget => 'Submit', );

    __PACKAGE__->meta->make_immutable;
    no HTML::FormHandler::Moose;
}


{
    package SM::Controller::Storage::LunField;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Field::Compound';
    use namespace::autoclean;

    has_field 'volume_group' => ( type => 'Text', size => 45, );
    has_field 'description' => ( type => 'TextArea', );
    has_field 'size_in_gb' => ( type => 'Integer', required => 1, );
    has_field 'mirrored_on_storage' => ( type => 'Text', required => 1, );
    has_field 'name' => ( type => 'Text', size => 45, required => 1, );
    has_field 'ip_addr_1' => ( type => 'Text', size => 45, required => 1, );
    has_field 'ip_addr_2' => ( type => 'Text', size => 45, required => 1, );
    has_field 'cluster_package' => ( type => 'Select', );
    has_field 'server' => ( type => 'Select', );
    has_field 'cat_os_category' => ( type => 'Select', );
    has_field 'storage' => ( type => 'Select', );
    has_field 'cat_product_category' => ( type => 'Select', );
    
    __PACKAGE__->meta->make_immutable;
    no HTML::FormHandler::Moose;
}




__PACKAGE__->config(
    action => {
        list => { Chained => 'base', PathPart => q{list}, Args => 0 },
        view => { Chained => 'base' },
        edit => { Chained => 'base' },
        edit_ajax => { Chained => 'base' },
        destroy => { Chained => 'base' },
        destroy_multiple => { Chained => 'base' },
    },
);

sub base : Chained('/') PathPart('storage') CaptureArgs(0) {}

1;

