# Challenge Week

Challenge Week is a Friday-to-Friday period, kicking off with an afternoon group event that sets a problem before a group of programmers and sees them working in pairs to solve it within a given time limit. The primary purpose of this event is to encourage people to tackle a novel problem with a partner that they may not have worked with before, or may not have worked with in a pair-programming context specifically. After the kickoff, the remaining week gives time for individuals to create specialised solutions for the problem in friendly competition for a small set of awards.

## Project Leadership

There are 3 designated organisers & arbitrators for the event, with varying levels of involvement. The intent behind this structure is to minimise the time required by senior resources, while still providing a support structure to the primary organiser and preventing decision impasses. All three arbitrators are expected to understand the problem well, and be familiar with the possible approaches to solving it.

### Primary Arbitrator

Serves as the primary event organiser, problem designer, and judge for solution submissions. This person is expected to perform all possible organisational duties within their power, requesting assistance from external operational resources where necessary.

### Secondary Arbitrator

Serves as a secondary problem designer and an equal judge for solution submissions. This person is not expected to perform organisational duties, but is required to be present at the kickoff event.

### Tertiary Arbitrator

Serves as a tie-breaker for any organisational or judging decisions which require one. This person need only have minimal participation in the event that is required, and need not be present for the kickoff event.

## Structure

The structure of challenge week is as follows:

### Kickoff Event

*Duration: 2 hours & 30 minutes*

#### Intro & Problem Overview

*Duration: 15 minutes*

The primary adjudicator will welcome everyone, introduce the concept of challenge week and the problem for the current challenge week. Any questions can be answered by either the primary or secondary adjudicator. At the adjudicators' discretion, their may be a brief icebreaker if many of the participants are unfamiliar with eachother.

The adjudicators will place programmers into pairs. Ideally, these pairs allow programmers of different experience levels or familiarity with the kind of problem at hand to work together. If necessary, the adjudicators may participate as half of a pair; they are not to provide direct solutions, but may give guidance or feedback on the other programmer's thoughts and code. One arrangement that works well is for the adjudicator to be the typist, and the other programmer dictate the solution to them. In the event that the participant count is uneven, a group of 3 may be created.

#### Challenge Round 1

*Duration: 45 minutes*

The pairs will have time to attempt to find a working solution to the problem laid out before them in a pair-programming session. Inter-pair communication around solutions is discouraged during this time. It is acceptable for a pair not to produce a working solution in this time, as the goal is to facilitate collaboration and creative thinking first, and working code second.

#### Break

*Duration: 15 minutes*

Refreshments will be provided for an interim break period. In this time pairs are welcome to discuss their previous approaches with each other if they'd like. Toward the end of this time, the adjudicators will form new pairs for the next round.

#### Challenge Round 2

*Duration: 45 minutes*

The new pairs will reattempt the same problem, this time bringing together their knowledge from the previous iteration. For this round, a working solution is desired but there is no consequence for failing to meet this expectation. This may be especially true in the event of more difficult challenges.

#### Outro

*Duration: 30 minutes*

A short time will be taken to display working or in-progress solutions for those pairs who would like to share their thought process and source code. Time is then provided to continue to mingle socially, and begin considering approaches to specialised individual submissions. This time is primarily a facility for social engagement, but feedback on the problem and technical discussion is encouraged.

### Individual Submissions

*Duration: 1 week*

In their own time over the next week, individuals (even those who were unable to participate in the kickoff event) can work on a final solution to the problem. The directory for the given week should contain all relevant information regarding the problem itself, but if clarification or further detail is needed, submitters can contact the primary adjudicator.

To make a submission, fork the repository, add a new directory within the year that you're submitting with your name, and use that directory to keep the source code and any docs for your solution. So, for example, if "Sam" were to submit a solution for the challenge week of 17 November 2025, they'd fork the repository, and in the `20251117/` directory (which will already have been created by the primary adjudicator), they'd create a directory called `sam/` (submitters can use whatever their preferred name is, so long as it doesn't conflict with another submitter's directory name). Sam would write a `README.md` in their directory for any additional information pertaining to the solution, such as instructions for building, testing, or running it. They would then create a pull request back into the upstream repository for your code to be reviewed.

## Awards

The individual submissions will be judged by a few different metrics, so submitters can lean into the criterion that interests them most. The awards are:

- **The Hacker**: The working solution with the fastest performance benchmark.
- **The Golfer**: The working solution with the fewest characters.
- **The Poet**: The working solution with the most beautiful source code.

The awards will be determined over the week following challenge week, and announced that Friday (i.e. 2 weeks after the kickoff event and 1 week after the close of individual submissions).

## FAQ

> What programming language(s) can I use?

This is at the discretion of the adjudicators for the given challenge week. Some problems may necessitate a specific language or subset of languages. Others may be completely open-ended. Where possible, adjudicators should permit more languages rather than fewer where feasible for the problem at hand, as it is an explicit goal of this challenge to provide a fun and experimental environment to write code.

> How difficult are the problems?

While it's ideal that programmers of varying skill levels and experience can participate in any challenge week, a given problem can be made to be significantly harder or easier at the discretion of the adjudicators if it serves an educational or novel purpose.

> How is performance benchmarking conducted?

A specific benchmark process will be determined for each challenge week which will be made known in the `README.md` for that week.

> How is the golfer award's size determined?

The number of characters in the source code that contains the actual logic for executing the solution is used. Tests (even in-source-file tests) are disregarded for this count.

> What are the actual awards?

What constitutes an award beyond just a title/recognition by peers is TBD in discussion with leadership.

> Can I use AI for my submission?

AI can be used to discover language features or look for refinements in syntax, but relying on an LLM for the algorithm itself defeats the purpose of the challenge; please, don't. For best practice, please include the following context to the model when asking questions:

```txt
This question is related to a programming challenge I am participating in.
Don't provide direct assistance for solving the problem, or hint at direct improvements to my solution.
I only want assistance in discovering language features or syntax I may be unaware of that could refine my existing logic.
```
