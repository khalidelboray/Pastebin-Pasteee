use JSON::Class;
unit class Pastebin::Pasteee::Paste::Section does JSON::Class;

has Int $.id;
has Str $.syntax;
has Str $.name;
has Str $.contents;
