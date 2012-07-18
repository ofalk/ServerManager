use strict;
use warnings;
use utf8;

package SM::Controller::CatServerModel;

use base "Catalyst::Example::Controller::InstantCRUDStylish";


# Generated automatically with HTML::FormHandler::Generator::DBIC
# Using following commandline:
# form_generator.pl --rs_name=CatServerModel --schema_name= --class_prefix=SM::Controller::CatServerModel --db_dsn=
{
    package SM::Controller::CatServerModel::CatServerModelForm;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Model::DBIC';
    use namespace::autoclean;

    use DateTime;


    has '+item_class' => ( default => 'CatServerModel' );

    has_field 'cpu_sockets' => ( type => 'Integer', );
    has_field 'name' => ( type => 'Text', size => 45, required => 1, );
    has_field 'cat_vendor' => ( type => 'Select', );
    has_field 'cat_cpu_type' => ( type => 'Select', );
    # has_field 'servers' => ( type => '+SM::Controller::CatServerModel::ServerField', );
    has_field 'submit' => ( widget => 'Submit', );

    __PACKAGE__->meta->make_immutable;
    no HTML::FormHandler::Moose;
}


{
    package SM::Controller::CatServerModel::ServerField;
    use HTML::FormHandler::Moose;
    extends 'HTML::FormHandler::Field::Compound';
    use namespace::autoclean;

    has_field 'license' => ( type => 'Text', size => 17, );
    has_field 'license_end' => ( 
            type => 'Compound',
            apply => [
                {
                    transform => sub{ DateTime->new( $_[0] ) },
                    message => "Not a valid DateTime",
                }
            ],
        );
        has_field 'license_end.year';        has_field 'license_end.month';        has_field 'license_end.day';
    has_field 'tags' => ( type => 'TextArea', );
    has_field 'asset_id' => ( type => 'Text', size => 45, );
    has_field 'patch_notes' => ( type => 'TextArea', );
    has_field 'reboot_notes' => ( type => 'TextArea', );
    has_field 'autodiscovery' => ( type => 'Text', );
    has_field 'iscsi_attached' => ( type => 'Text', );
    has_field 'description' => ( type => 'TextArea', );
    has_field 'maintenance_end' => ( 
            type => 'Compound',
            apply => [
                {
                    transform => sub{ DateTime->new( $_[0] ) },
                    message => "Not a valid DateTime",
                }
            ],
        );
        has_field 'maintenance_end.year';        has_field 'maintenance_end.month';        has_field 'maintenance_end.day';
    has_field 'fc_attached' => ( type => 'Text', );
    has_field 'serial_nr' => ( type => 'Text', size => 45, );
    has_field 'delivery_note_id' => ( type => 'Text', size => 45, );
    has_field 'management_hostname' => ( type => 'Text', size => 45, );
    has_field 'management_ip' => ( type => 'Text', size => 45, );
    has_field 'additional_ip' => ( type => 'TextArea', );
    has_field 'default_gateway' => ( type => 'Text', size => 45, );
    has_field 'subnet_mask' => ( type => 'Text', size => 45, );
    has_field 'ip_address' => ( type => 'Text', size => 45, );
    has_field 'rack' => ( type => 'Text', size => 45, );
    has_field 'application' => ( type => 'TextArea', );
    has_field 'cpu_speed' => ( type => 'Integer', );
    has_field 'cores_per_cpu' => ( type => 'Integer', );
    has_field 'physical_cpus' => ( type => 'Integer', );
    has_field 'memory_in_mb' => ( type => 'Integer', );
    has_field 'documentation_url' => ( type => 'TextArea', );
    has_field 'delivery_date' => ( 
            type => 'Compound',
            apply => [
                {
                    transform => sub{ DateTime->new( $_[0] ) },
                    message => "Not a valid DateTime",
                }
            ],
        );
        has_field 'delivery_date.year';        has_field 'delivery_date.month';        has_field 'delivery_date.day';
    has_field 'hostname' => ( type => 'Text', size => 45, required => 1, );
    has_field 'cat_accounting_type_id' => ( type => 'Integer', );
    has_field 'cluster' => ( type => 'Select', );
    has_field 'operator_group' => ( type => 'Select', );
    has_field 'cat_domain' => ( type => 'Select', );
    has_field 'cat_os_architecture' => ( type => 'Select', );
    has_field 'patchtime' => ( type => 'Select', );
    has_field 'cat_status' => ( type => 'Select', );
    has_field 'cat_site' => ( type => 'Select', );
    has_field 'cat_asp' => ( type => 'Select', );
    has_field 'cat_location' => ( type => 'Select', );
    has_field 'cat_os_version' => ( type => 'Select', );
    has_field 'cat_os_category' => ( type => 'Select', );
    has_field 'cat_server_model' => ( type => 'Select', );
    has_field 'cat_product_category' => ( type => 'Select', );
    has_field 'cat_support_level' => ( type => 'Select', );
    
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

sub base : Chained('/') PathPart('catservermodel') CaptureArgs(0) {}

1;

