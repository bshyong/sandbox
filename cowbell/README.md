# Cowbell - Event Logging on the World Wide Web

## Problem

Web bug is widely used for tracking information about the viewer for web pages, emails, and other HTML supporting documents. The goal of this project is to design and implement an end-to-end event logging product. As of the first pass, we will model after the use case of logging impressions for a HTML element in a responsive webpage. 

A few words about the name - In the dynamic web today, HTML elements are like freely roaming livestocks. We believe that just like how a shepherd wants to be able to locate his/her animal sites and applications want to be able to learn about events happening in customers' browser. 

## Success Criteria

The goal for this project is simple: accurately log impressions and clicks for an HTML element in a responsive webpage. The MVP is an e2e pipeline that consists of a frontend library and backend services to handle the fired events appropriately for analytics.

## Architecture overview

Inspired by Snowplow's clean technical architecture, Cowbell will have a similiar but different workflow. 

Cowbell consists of 5 stages:

1. Tracker
2. Collector
3. Preprocessor
4. Persistence
5. Analytics

Subsequent sections will describe the stages in more detail. 

## Tracker

Track is the frontend component that monitors and reacts to registered events. For the MVP, we will focus on two types of events - 'impress' and 'click'.

## Tracker integration

We will only be implementing a JS tracker for v1. The easiest way to push js out to sites is to use a CDN like cloudfront. Webpages can synchronously or asynchronously integrate js code (see https://github.com/snowplow/snowplow/wiki/integrating-javascript-tags-onto-your-website).


Setup reference: https://github.com/snowplow/snowplow/wiki/javascript-tracker-setup

### Impression logging

In order for impression logging to work properly, we need to be able to:

+ Lazy loading pixels - Only emit a logging pixel when the html element is in the view port
+ SMART unit logging - emit an unit impression when 3 out of 5 pixels are emitted (50% displayed)
+ Unique identifiers for pixels that will not run out
+ Support payload - pass in contextual info/additional data (page context, customer data)

### Click logging

One way to do click logging it to do it via redirection. The benefit of this approach is that click logging is then js-independent. Redirection does not add a lot of js footprint to the page and is fairly robust. However, redirection means the content owner has to be able to appropriately assemble a redirection url for this approach to work. Another way to do the same old click event firing like how most JS libraries support (think jQuery).

## Collector

For now, the collector can be a dummy server that keeps a map of logged events.


## References
+ Snowplow: https://github.com/snowplow/snowplow
+ http://www.irongeek.com/i.php?page=security/webbugs
+ http://stackoverflow.com/questions/6638504/why-serve-1x1-pixel-gif-web-bugs-data-at-all
+ Clever Impression Tracking Technique [http://weblogs.asp.net/scottgu/267181]
+ Pixel Delivery Best Practices [https://www.admonsters.com/blog/pixel-delivery-best-practices]
+ http://storm.incubator.apache.org/
+ http://highscalability.com/blog/2013/1/21/processing-100-million-pixels-a-day-small-amounts-of-content.html
+ LazySizes: https://github.com/aFarkas/lazysizes

