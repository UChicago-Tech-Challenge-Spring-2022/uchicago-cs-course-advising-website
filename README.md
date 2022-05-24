# README

## CSS and Devise
- put css codes in app/assets/stylesheets/application.css and you can access it anywhere
- sign up page's view: devise/registration/new.html.erb
- sign in page's view: devise/session/new.html.erb
- forgot your password's view: devise/password/new.html.erb

## Current TODOs:
- Finish Notification Page (Link to Github page w/ instruction of how to set up)
- Finish the CS manual with course info from model analysis

## Standard Workflow

 1. Start the web server by running `bin/server`.
 1. Navigate to your live application.
 1. As you work, remember to navigate to `/git` and **commit often as you work.**

>RCAV (Route -> Controller -> Action -> View

run with bin/server

>Route

routers.rb shows the route and defines which controller and action it refers to (see the example "/" already set up)

>Controller + Action

insider controller folder
contorller name must fit the name defined in previously mentioned route, 
action is under a controller, and it should render a page by referring to a template(see controller "Home", action "homepage", which is linked with the route "/"

>View

inside views folder, this is where the looks of the website will be in
**html.erb means you could write ruby in html**
<% ruby %>    renders nothing on the html page, does whatever is inside on backend
<%= ruby %>   return value (either display or be inserted into a link, etc)

>That's it! 

Run _bin/server_ and open the popped out window, and enter the route "/" in the website window, and you should see the example page!

**Note**
Add perssion to gitpod, go to https://gitpod.io/integrations, inside git providers, edit permission, tick all boxes. Also manage on github.com and click grant for organization

