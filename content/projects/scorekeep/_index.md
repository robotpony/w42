---
title: Scorekeep
description: Launch news, changelogs, and dev notes for Scorekeep, which keeps score for card and dice games and feels like paper.
# Draft until the first post lands, so the section doesn't ship empty.
draft: true
ShowRssButtonInSectionTermList: true
# #todo Add a share card (images: ["images/scorekeep-share.png"], here and in the cascade), as Space Command has.
cascade:
  params:
    hiddenInHomeList: true
    seriesTag: scorekeep
    showDescription: true
---

[Scorekeep](https://scorekeep.warpedvisions.org) is a scorepad for the card and dice games you actually play. It's a simple iPhone and iPad app that does the maths, applies house rules, and remembers every game, on virtual paper sheets.

<!-- #todo ", on virtual paper sheets" dangles (reads as remembering games on paper). Try: "It's a simple iPhone and iPad app with sheets that look like paper. It does the maths, applies house rules, and remembers every game." Also: "maths" is British; Canadian is usually "math". -->

> **Coming soon, testing now.** Scorekeep 1.0 is in TestFlight while I finish the App Store checklist and a last round of playtesting. Want to try it? Email [scorekeep@warpedvisions.org](mailto:scorekeep@warpedvisions.org) for an invite, and send bugs to the same address. Until the first release, saved games may not survive from one test build to the next.

### What it does

- Each sheet looks like its paper analogue: a running total for Dice, a hole grid for Golf, a two-column ledger for Gin, a peg board for Cribbage
- Enter your score using a number pad, and editing is easy
- Turn it sideways at the table and the sheet goes full-screen, showing the whole sheet
- Every game is saved, and every player is ranked by win rate, per game or overall
- And each game gets a cheat sheet and basic instructions that work offline

<!-- #todo Bullet 2 joins two ideas and "editing is easy" is vague. Try: "Enter scores on a number pad, and fix any of them with a tap". -->
<!-- #todo Bullet 3 says "sheet" twice. Try: "Turn it sideways at the table and the sheet goes full-screen, so you see every round". -->
<!-- #todo Bullet 5: drop the leading "And": "Each game gets a cheat sheet and basic instructions that work offline". -->

### The games

Ten games, house rules built in: Dice 10,000, 4-Card Golf, Gin Rummy, Cribbage, Crazy 8s, Swipe, German Whist, 4-Card and 6-Card Turtle, and Maxi Dice. Village Idiot comes as a rules guide, as we teach this game often enough that the cheat sheet itself saves us time.

<!-- #todo "house rules" → "our house rules" says whose they are. -->
<!-- #todo Village Idiot: "as … as" doubles, and every game already has a cheat sheet, so say what's different. Try: "Village Idiot has no score sheet, just a rules guide: we teach it often enough that the cheat sheet alone saves us time." -->

### Why I built it

We play a lot of games, and not just at home. We've discovered the fun in taking a deck of cards and a bag of dice with us on our walks so we can hunker down at the beach, in coffee shops, and in pubs. We have a bunch of game-friendly businesses here, and it's a good motivator to get our asses out into those shared third spaces.

We even bring our games on vacation: to the beach, on decks and verandas, in parks, and when sailing. There is always time to play a game when we're winding down.

<!-- #todo "at the beach" (previous paragraph) then "to the beach": keep if deliberate, otherwise drop one. -->
<!-- #todo "There is always time" → "There's always time", to match the contractions elsewhere. -->

While paper works well enough, we started using a spreadsheet years ago to score our family's version of 4-Card Golf. Try using that spreadsheet on a phone and the motivation for a simple app becomes crystal clear: data should be easy and tracking should be as automatic as possible.

<!-- #todo "crystal clear" is stock; "becomes obvious" does the same job. "data should be easy and tracking should be as automatic as possible" is abstract; the earlier "data entry sucks, and everything's manual" was concrete and in your voice. -->
<!-- #todo The cheat-sheet reason was cut ("we're always teaching new people our favourite games"); it explains the cheat sheets and Village Idiot, so consider bringing it back. -->
<!-- #todo No closing line: one sentence on playing with it now, or back to the TestFlight invite. -->
