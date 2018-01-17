# Project Lawrie

Project Lawrie was a commissioned webscraper project for StepChange Debt Charity. It takes its name from the employee who would be using the app.

Accessible here: https://project-lawrie.herokuapp.com/

## App purpose

The process of gathering media data and formatting it in a quick-digestable email format was repetitive and time consuming. It involved copy and pasting a headline, making that headline a link and adding the news organisation in brackets afterwards. On some days, the Media Monitor could be 15 or 20 items long.

StepChange wanted a simple program that could: 

- gather URLs the person compiling the Media Monitor had collected 
- scrape some content from those URLs 
- return it formatted in a way that someone could easily distribute via email to colleagues on the distribution list.

The app requires a very basic output screen, hence the lack of much styling. That may be changed in the future.

The code makes use of some excellent Ruby Gems such as `nokogiri` and `httparty` to aid with webscraping. 

## Gif of app

<img src="https://im5.ezgif.com/tmp/ezgif-5-5f39a988f0.gif" alt="A gif of how the app works" width="650px"  />

## App outcomes

The app now streamlines a previously laborious element of Lawrie's job. The relative automation of this job saves the charity roughly 200 work hours per year, and frees up Lawrie - or whoever is responsible for compiling the Media Monitor - to work on other non-BAU issues.
