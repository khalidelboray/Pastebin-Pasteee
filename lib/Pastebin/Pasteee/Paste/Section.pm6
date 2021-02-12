use JSON::Class;
#| Represents a paste section
unit class Pastebin::Pasteee::Paste::Section does JSON::Class;

#| The Section id
has Int $.id;
#| Section syntax. Default: autodetect
has Str $.syntax is default("autodetect");
#| Section name. Default: New Paste 1-10
has Str $.name;
#| Section contents
has Str $.contents;
