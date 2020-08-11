import UIKit

// Write a function mergeRanges() that takes an array of multiple meeting time ranges and returns an array of condensed ranges

/// To do this, you’ll need to know when any team is having a meeting.
/// In HiCal, a meeting is stored as an instance of a Meeting class with integer properties startTime and endTime.
/// These integers represent the number of 30-minute blocks past 9:00am.

/// let meeting1 = Meeting(startTime: 2, endTime: 3)  // meeting from 10:00 – 10:30 am
/// let meeting2 = Meeting(startTime: 6, endTime: 9)  // meeting from 12:00 – 1:30 pm

class Meeting: CustomStringConvertible, Equatable {

    var startTime: Int
    var endTime: Int

    init(startTime: Int, endTime: Int) {

        // number of 30 min blocks past 9:00 am
        self.startTime = startTime
        self.endTime = endTime
    }

    var description: String {
        return "(\(startTime), \(endTime))"
    }

    static func == (lhs: Meeting, rhs: Meeting) -> Bool {
        return lhs.startTime == rhs.startTime && lhs.endTime == rhs.endTime
    }
}

func mergeRanges(in meetings: [Meeting]) -> [Meeting] {
  // make a copy so we don't destroy the input
  var sortedMeetings = meetings.map {
    Meeting(startTime: $0.startTime, endTime: $0.endTime)
  }
  
  // sort by start time
  sortedMeetings.sort { $0.startTime < $1.startTime }
  
  // initialize mergedMeetings with the earliest meeting
  var mergedMeetings = [sortedMeetings[0]]
  
  for i in 1..<sortedMeetings.count {
    let currentMeeting = sortedMeetings[i]
    let lastMergedMeeting = mergedMeetings[mergedMeetings.count - 1]
    
    if currentMeeting.startTime <= lastMergedMeeting.endTime {
      
      // if the current meeting overlaps with the last merged meeting, use the
      // later end time of the two
      lastMergedMeeting.endTime = max(lastMergedMeeting.endTime,
                                      currentMeeting.endTime)
    } else {
      
      // add the current meeting since it doesn't overlap
      mergedMeetings.append(currentMeeting)
    }
  }
  
  return mergedMeetings
}

let meetings = [
  Meeting(startTime: 0,  endTime: 1),
  Meeting(startTime: 3,  endTime: 5),
  Meeting(startTime: 4,  endTime: 8),
  Meeting(startTime: 10, endTime: 12),
  Meeting(startTime: 9,  endTime: 10)
]

print(mergeRanges(in: meetings))
