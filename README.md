# alfred-rubyapi-workflow 

Simple workflow to search rubyapi.org

# Installing
- Download for workflow is in dist/

# Usage
- Use "rb <search>" to bring up results.
- Hit Enter to open that result in your browser.


You can optionally press CMD + Enter to open all search results for that query.

(The autosuggest GraphQL query has limited results.)

# Notes 

The GraphQL API the project has isn't great for this, using the `search` query
results has only the `name` and `description` fields.  The issue is, the name field
doesn't use the identifier from the `RubyMethodType` class.  So for example, if
you search `to_a`, you'll bring up results for multiple classes that have
`to_a`, but their name will just be `to_a` and not something like: `Array#to_a`


I might create a PR, to change it so the RubyMethodType classes uses the

`identifier` method for it's name field, which would work.



# License

Please see LICENSE.
