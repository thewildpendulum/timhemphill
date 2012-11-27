# timhemphill.com

## About
This is the repo for my professional website and blog. It runs on node.js and Backbone. Making it gave me the excuse to also try out CoffeeScript and Yeoman. I use EpicEditor and marked to write and publish new posts straight from the site and I store everything in a mongo database with mongoskin.

Feel free to poke around. Once the site is up, there will be blog posts about how I put everything together.

## Dev
I decided to cram everything into this repo, so it'll take just a bit of work to get everything running. My main priority is getting this thing done, so I haven't taken the time to properly configure the build process for my workflow, but the general setup is as follows:

I have a separate directory where I put together the node app. It looks like this:

```
/root
  app.js
  /public
    favicon.ico
    /epiceditor
    /scripts
    /styles
  /views
    index.ejs
```

I scaffolded the frontend with the Yeoman Backbone generator. Running `yeoman server` in this repo will compile the scripts from CoffeeScript to JavaScript and output them in `/public/scripts`. Right now, I'm just pulling the rest from the repo and dropping them into the node app directory.

* `/app/scripts/vendor` gets moved to `/public/scripts/vendor'
* `/app/styles` gets moved to `/public/styles`
* same with `epiceditor`
* same with `favicon.ico`
* `/app/index.html` -> `/views/index.ejs`

Then you can kill Yeaoman and run `node app.js` and open up your browswer at localhost:3501.

Yeah, it's a huge PITA. If I were more enterprising, I would have mocks for the db and api so I could do frontend and backend dev separately and there would be tests and things. But again, I'm just trying to get to 'done' before I get to 'good'. I've got a lot of notes on smoothing out the dev process, including getting yeoman and express to play nice together, CoffeeScript sourcemaps for debugging, etc. Check back in a while to see how it turns out!