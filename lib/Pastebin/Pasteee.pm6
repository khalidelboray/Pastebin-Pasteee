use Pastebin::Pasteee::Paste;
unit class Pastebin::Pasteee;
use JSON::Class;
use WWW :extras;
use JSON::Fast;
class X is Exception {
    has $.message
}



has $.api-url = "https://api.paste.ee/v1/";
has Str $.token is required("You must provide you api token");

method pastes(Int :$page = 1 ,Int :$perpage = 25) {
    my $res = jget $!api-url ~ 'pastes', :X-Auth-Token($!token);
    return $res<data>.map: { Pastebin::Pasteee::Paste.from-json($_.&to-json) };
}

multi method paste(Pastebin::Pasteee::Paste :$paste!) {
    my $res = jpost $!api-url ~ 'pastes', $paste.to-json(:skip-null, :!pretty), :X-Auth-Token($!token),
            :Content-Type<application/json>
            orelse die X.new: :message(.exception.message);
    return $res<link>;
}

multi method paste(Str $id) {
    my $res = jget $!api-url ~ "pastes/$id", :X-Auth-Token($!token)
            orelse die X.new: :message(.exception.message);
    return Pastebin::Pasteee::Paste.from-json($res<paste>.&to-json);
}

multi method paste(Str $id,Bool :$delete!) {
    my $res = jdelete  $!api-url ~ "pastes/$id", :X-Auth-Token($!token)
            orelse die X.new: :message(.exception.message);
    return $res<success>;
}

method delete(Str $id) {
    self.paste($id, :delete);
}

method fetch(Str $id) {
    self.paste($id);
}