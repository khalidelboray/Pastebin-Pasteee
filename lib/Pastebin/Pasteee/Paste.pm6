use JSON::Class;
use Pastebin::Pasteee::Paste::Section;
#| Represents a paste
unit class Pastebin::Pasteee::Paste does JSON::Class;
has Str $.id;
#| Whether the paste should be treated as encrypted. Default: false
has Bool $.encrypted is default(False);
#| Overall paste description.
has Str $.description is default('');
#| How many times was the paste viewed.
has Int $.views;
#| When the paste was created.
has Str $.created_at;
has Str $.expires_at;
#| Array of sections.
has Section @.sections;