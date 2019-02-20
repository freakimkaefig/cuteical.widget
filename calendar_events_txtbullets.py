#!/usr/bin/python
# -*- coding: utf-8 -*-

import os, subprocess


def prettify_calendar():
	html = ""

	#remove error from icalbuddy and get calendar info for today
	with open(os.devnull, 'w') as devnull:
		raw_events = subprocess.check_output(["/Users/luklamm/Library/Application Support/Übersicht/widgets/ical.widget/icalBuddy","sudo","-nrd","-nc","-n","-b", "● ","-eep","location,url,notes,attendees" , "eventsToday"], stderr=devnull)

	html = display_events(html, "Today", raw_events)

	print(html)


def display_events(html, what_day, raw_events):
	events = raw_events.split("\n")
	#display events for the day
	if len(events) < 2:
		html += "<div class='today'>\n<div class='title'>No events planned for "+what_day.lower()+"</div>\n</div>"
	else:
		html += "<div class='today'>\n<div class='title'>"+what_day+"'s Events</div>"
		for i in range(len(events)):
			if events[i].find("●") != -1:
				html += "\n<div class='event_title'>"+events[i].replace("●", "<span class='icon'>●</span>")+"</div>"
			elif events[i] == "":
				pass
			else:
				html += "\n<div class='event_time'>"+events[i]+"</div>"
		#close  div
		html += "\n</div>"

	return html

prettify_calendar()
