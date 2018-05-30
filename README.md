# url_shortener

## Requirements

Write a URL shortening service. It should meet the following requirements:

* For a given URL, when entered in the browser input, it should return a shortened version that points to a local service.
* The local service should be able to proxy the shortened URL to the real destination.
* The shortened URL should be less than 8 characters long.

Additional points:
* How would you scale this service to millions of users?
* How would provide analytics or usage metrics on this service?
* What useful additional feature would you add to this service?

Please compile your project into a Github repo and provide a link upon completion. Let me know if you have any questions! Once this is completed, we'll move to an onsite where we will review your code and you can meet the entire team.

## Assumptions (to be clarified with imaginary PM)

* When you say “proxy”, I assume you mean a 301-redirect response - which is what the https://goo.gl/ shortener does.
* “URL less than 8 characters” I assume means the “path” portion of the URL.
* I’ll make it case insensitive so people can more easily type it when they’re using a mobile browser - but it means we’d have to go to *nine* digits once we scale beyond about _2000 giga-URLs_ (2821109907456).

## Roadmap (POC -> MVP -> Pain -> Scalable)

1. Proof of Concept: Rails app that responds to http://localhost:3000/shortURL with a 301
to the real destination.
2. Minimal Viable Product: Elixir/phoenix app directly maps URLs to DB rows (like Rails)
3. Hockey Stick: pay for larger DB and more and more and more app servers. Build software for 9 or more characters.
4. Scalable: elixir agent holds an entire LRU cache (since this is mostly read-only data) which falls back to a DB lookup.

## Installation

`git clone`
`rails s`
`open http://localhost:3000/`
