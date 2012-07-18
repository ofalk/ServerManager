use utf8;
package SM::DBSchema::Result::CatSite;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

SM::DBSchema::Result::CatSite

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::UTF8Columns>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "UTF8Columns");

=head1 TABLE: C<CAT_SITE>

=cut

__PACKAGE__->table("CAT_SITE");

=head1 ACCESSORS

=head2 site_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 short_name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=cut

__PACKAGE__->add_columns(
  "site_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "short_name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);

=head1 PRIMARY KEY

=over 4

=item * L</site_id>

=back

=cut

__PACKAGE__->set_primary_key("site_id");

=head1 RELATIONS

=head2 servers

Type: has_many

Related object: L<SM::DBSchema::Result::Server>

=cut

__PACKAGE__->has_many(
  "servers",
  "SM::DBSchema::Result::Server",
  { "foreign.cat_site_id" => "self.site_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 storages

Type: has_many

Related object: L<SM::DBSchema::Result::Storage>

=cut

__PACKAGE__->has_many(
  "storages",
  "SM::DBSchema::Result::Storage",
  { "foreign.cat_site_id" => "self.site_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2012-07-03 18:14:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oJov93lGvLLWfVg8U5FyKg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
use overload '""' => sub {$_[0]->name}, fallback => 1;
__PACKAGE__->utf8_columns(qw/site_id name short_name/);

1;