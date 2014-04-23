### Intro

Goal is to have multiple app or own data going into Beeminder.com for tracking, motivation, and a [quantified self] look at data in one location.

This repo for now will only deal with HarvestApp.com time tracking being pushed to Beeminder.com goals.

--

#### Overview

Some of the methods here can be used on their own. Like the code in base.rb, and specifically harvest.rb and beeminder.rb are basic methods that do specific things with the APIs of their respective services. Those methods can be used on their own, if need be.

This project does contain a specific way to push Harvest data to Beeminder.

#### Random tidbits about this code

- Using three gems: 'dotenv', 'beeminder', 'harvest'.
- Storing Beeminder and Harvest authentication in a .env file.
- Messy and initially made just to save me time for my own specific and perhaps peculiar Harvest and Beeminder workflow.


#### Configuration

There are three sample files:
- .env-sample: Rename to .env and add in your Beeminder and Harvest authentication here.
- Inside code/data is beeminder.example.txt: Rename to beeminder.txt. List out the goals you want to have updated with Harvest data.
- Inside code/data is harvest.example.txt: Rename to harvest.txt. List out the clients whose times you want to push to Beeminder.

The current way with how the code takes and uses the beeminder and harvest text file data is specific to my use case and specified below in the "Specifics for my own use case" section.


#### Code Files

- base.rb: General file with two simple methods that are used within the other methods/files.

- harvest.rb: Contains two methods, "total_time" and "client_time". They can get time data for a specific day.

- beeminder.rb: Just one method, "update_beeminder_goal". Basically a wrapper around Beeminder gem code. Method allows you to update a specific goal for a specific day.

- beeminder-harvest.rb: Pushing Harvest to Beeminder. No methods here. This file should be updated according to each person's uses case. My use case is pretty specific and is explained below.


#### Specifics for my own use case

  The beeminder-harvest.rb file is specific for my own use case.
  I have 7 goals in my beeminder.txt and 5 clients in my harvest.txt. In other words, I have X goals in my beeminder.txt and X - 2 goals in my harvest.txt.
  The first two goals in beeminder.txt are aggregate goals. The very first one is a complete aggregate of all the Harvest client times. While the second goal is for all the Harvest client times except the last client listed.


#### Current Usage

If pushing yesterdays Harvest data to Beeminder, run "ruby beeminder-harvest.rb". So if in the root folder of this project, you would run "ruby code/beeminder-harvest.rb".

--

##### Mini-Roadmap

  Added Github issues for most immediate to-dos.
  
  Overall, the goal is to have the project be more general and accessible. For example, there should be an already coded way to just push each clients time to a Beeminder goal. And the code shouldn't be so specific to just my use case.

--

There's another repo that deals with Basecamp.com pushes to Beeminder goals.

So there'll be overlap of code between the repos. Might combine repos when things are more settled.

**Maybe**
- Asana to-dos
- Trello to-dos