# timhemphill.com

## About
This is the repo for my professional website and blog. It runs on node.js and Backbone. Making it gave me the excuse to also try out CoffeeScript and Yeoman.

Feel free to poke around. Once the site is up, there will be blog posts about how I put everything together.

## Dev
I'm currently reworking the build process. Yeoman is a great tool, but seems to be getting in the way when trying to build out the front and back end at the same time (and I couldn't get the Yeoman/Express stack to work properly). While starting off with proper tests might have made this easier, I've already got the API and DB working, so writing mocks/stubs at this point feels superfluous. Instead, I've switched to just using grunt by itself, which I've been enjoying immensely. In stark contrast to earlier commits, building this project is now dead simple (assuming you've got node, mongo, and grunt all ready to go).

Install the dependencies:

`npm i`

...build the project using grunt:

`grunt`

...and that's it. Just run `node server.js`, navigate to localhost:3501 in your broswer, and bask in the glory.

If there were tests, they wouldn't be passing with this commit, but that'll change soon. I just wanted to get things organized before moving any further. The next couple rounds of commits will bring:

* Mocha tests for both the Express server and Backbone app
* ~~source mapping for debugging straight from CoffeeScript~~

I had grandiose dreams for this project, but after 7 months not making this blog and being very busy doing this same thing, but for money, I realized that something is better than nothing. The end result will be minimal, but functional, and we can iterate on the rest, right?

If it strikes you, don't hesistate to pillage my code is you see anything useful.
