---
slug: the-facade-of-uptime
title: The facade of uptime
date: 2012-02-10T00:04:49Z
draft: false
tags:
- software-development
- software-design
---

While writing a spec earlier today the last few years of progress in server land hit me: uptime is a facade.

In the early days, server resources were expensive and scarce. Uptime was sacred. Long running hardware was celebrated, UNIX
tools were born, beer was consumed.

The problem of focusing on the hardware is that it detracts from the time you spend developing software. Remember those late
nights configuring RAID setups? What about hunting down faster drives, or terminating SCSI cables?

With utility computing like Amazon Web Services, hardware no longer exists. Slices of computing are sold by the hour, by the
byte, and by the feature. Provisioning is nearly instant, and can be controlled by API, from any machine connected to the net.

Machine uptime doesn't matter. It's been replaced by ubiquity.

It ends up that *service* uptime doesn't matter either. Instead of thinking about keeping continuous instances running, we
need to focus on ways to make it easier to replace instances, and mechanisms for pooling service resources in ways that fail
over gracefully.

As the cost of swapping servers approaches zero, it becomes the ultimate form of stability and parallelization.

While I was thinking about uptime tonight, an impending software update threatened the honour of my computer. My first
reaction was to avoid running the updates: this machine was nearing 3 months between reboots.
