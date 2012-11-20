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

I scaffolded the frontend with the Yeoman Backbone generator. Running `yeoman server` in this repo will create a `temp` directory with all the scripts compiled from CoffeeScript to JavaScript. Right now, I'm just pulling things from the repo and dropping them into the node app directory.

* `temp/scripts` and '/app/scripts/vendor` get moved to `/plublic/scripts'
* `app/styles` gets moved to `/public/styles`
* same with epiceditor
* same with the favicon
* `app/index.html` -> `/views/index.ejs`

Then you can run `node app.js` and open up your browswer at localhost:3501. But Yeoman and express can't be running the app at the same time, since they're set to use the same port and the app can't hit the db without express.

Yeah, it's a huge PITA. I've got a lot of notes on smoothing out the build process, including deploying to express instead of phantom.js with `yeoman server`, CoffeeScript sourcemaps for Chrome, etc. Check back in a while to see how it turns out!