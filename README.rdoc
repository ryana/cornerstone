== Cornerstone

A buzzword EXTRAVAGANZA!

RVM
Ruby 1.9.2-p0
Rails3
MongoMapper (on or off MongoHQ)
Devise
SendGrid
Chargify
Environment-aware Configuration Management

Most config is in config/harmony.yml

You'll want to create a free account on MongoHQ.com, a free account on SendGrid.com,
and a free account on Chargify.com.  For Chargify, make sure you enable API Access.

=== RVM
Install it.  Use it.  You'll be happy.  The .rvmrc file in the repo will tell RVM to
switch to Ruby 1.9.2 when you `cd` in

=== Ruby 1.9.2
It works.  Use it.  RVM can be used to install:  ruby-1.9.2-p0

=== Rails3
Yeah.

=== MongoMapper
What can I say?  I'm a fanboy.  If you want to run your own server, then
you can figure out the config.  If you don't want to deal with that, check out
the free accounts on MongoHQ.com.  On my laptop over wifi connecting to
a free DB in MongoHQ, I had /users/sign_in response times of ~300ms.  When I
turned on safe mode on the User model, that went up to 400ms.  Fine by me.
(Safe mode stayed on by default, btw).

Check out config/initializers/mongodb.rb

=== Devise
VERY impressed with Devise.  Everything "just works."  Very sensible defaults.

Check out config/initializers/devise.rb

=== SendGrid
200 emails a day for free.  Perfect for testing.  1/1000th of a cent per email ($10/mo for 10k emails)
is a good deal.

I hooked it up to Devise in config/initializers/sendgrid.rb

=== Chargify
The level of IMPRESSED I was at Devise doesn't hold a candle to Chargify.  These guys know
what the hell they are doing.

Go create an account.  www.chargify.com.  If you've used PayPal, your JAW WILL DROP when you see how awesome their
API is implemented and documented.

config/initializers/chargify.rb

=== CM
I pulled a config thing from an @jnunemaker gist somewhere and @angilly-ified it.

config/harmony.yml & lib/harmony.rb

== Other stuff
=== Usage
Do what you want with this.  Clone it.  Fork it.  Create issues.  Whatever.

=== me
ryan@angilly.com
@angilly
