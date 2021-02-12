# Pastebin::Pasteee 

### DESCRIPTION
    use paste.ee API via Raku
    
# Example

```perl6
    use Pastebin::Pasteee::Paste;
    use Pastebin::Pasteee::Paste::Section; 
    use Pastebin::Pasteee;
    my $p = Pastebin::Pasteee.new: :token<your_api_token>;
    my $paste-url = $p.paste:
            Pastebin::Pasteee::Paste.new: :description("Test"),
                    :sections(
                        Pastebin::Pasteee::Paste::Section.new: 
                            :name<Section1>, 
                            :syntax<perl>, 
                            :contents('print "Hellow World!"')
                    );
    say $paste-url; # https://paste.ee/p/<paste_id>
```

class Pastebin::Pasteee
-----------------------

use paste.ee API via Raku

### method pastes

```perl6
method pastes(
    Int :$page = 1,
    Int :$perpage = 25
) returns Mu
```

Get user pastes.

### multi method paste

```perl6
multi method paste(
    Pastebin::Pasteee::Paste :$paste!
) returns Mu
```

Create a paste

### multi method paste

```perl6
multi method paste(
    Str $id
) returns Mu
```

Fetch Paste info

### multi method paste

```perl6
multi method paste(
    Str $id,
    Bool :$delete!
) returns Mu
```

Delete a paste

### method delete

```perl6
method delete(
    Str $id
) returns Mu
```

Delete a paste

### method fetch

```perl6
method fetch(
    Str $id
) returns Mu
```

Fetch Paste info

### method info

```perl6
method info() returns Mu
```

User/key information