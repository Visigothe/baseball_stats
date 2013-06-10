# Baseball Stats

This is a basic app for listing baseball stats for hitters during the 1998 baseball season.

## Requirements

The hitters need to be displayed in a table that shows the following statistics for each player: AVG, HR, RBI, Runs, SB, and OPS.

The table needs to be sortable and the default sort should be by AVG in descending order.

Clicking on a sortable column header sorts the data by the selected column without reloading the page.

The table contains data for 25 hitters, either the best or worst depending on the sort.

Only the relevant data for the current display should be sent to the browser. (All player record should not be sent to the browser.)

Basic styling is required, but a fully customized UI is not needed at this point since this is just proof of concept.

## Reflections

While the point here was to work with a limited data set to produce a result that could be expanded on, there are a few things that I would change when looking at the bigger picture. Rather than listing them all here I will briefly talk about two of them.

First, the data structure would have to change a bit since there would be a lot of duplication. Moving data from the Hitter table to other smaller, but associated, tables would allow for more flexibility while still allowing for the appropriate associations. For example:

  A player can play for many teams and have many seasons, and each season they could play multiple positions, some of which might not be considered a "hitting" position. If all the data were in one table it could conceivably be harder to find out how they did over a season if they played for multiple teams.

I would also consider making a larger query up front based on need and then caching the results. While this would mean a longer load time initially, it would also mean that subsequent sorts and such would be a lot faster.

