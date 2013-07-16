//
//  NSDate+DSEasy.h
//
//  Created by Derek Bowen
//  Copyright (c) 2012, Demiurgic Software
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//  * Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//  * Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
//    documentation and/or other materials provided with the distribution.
//  * Neither the name of the <organization> nor the
//    names of its contributors may be used to endorse or promote products
//    derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
//  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import <Foundation/Foundation.h>

@interface NSDate (DSEasy)

// Common
+ (NSDate *)dateYesterday;
+ (NSDate *)dateTomorrow;
+ (NSDate *)dateAtBeginningOfDay;
+ (NSDate *)dateAtEndOfDay;
+ (NSDate *)dateAtMidnight;
+ (NSDate *)dateAtBeginningOfHour;
+ (NSDate *)dateAtEndOfHour;
- (NSDate *)dateAtBeginningOfDay;
- (NSDate *)dateAtEndOfDay;
- (NSDate *)dateAtMidnight;
- (NSDate *)dateAtBeginningOfHour;
- (NSDate *)dateAtEndOfHour;

// Since now
+ (NSDate *)dateYearsSince:(NSInteger)yearsSince;
+ (NSDate *)dateMonthsSince:(NSInteger)monthsSince;
+ (NSDate *)dateDaysSince:(NSInteger)daysSince;
+ (NSDate *)dateHoursSince:(NSInteger)hoursSince;
+ (NSDate *)dateMinutesSince:(NSInteger)minutesSince;
+ (NSDate *)dateSecondsSince:(NSInteger)secondsSince;

// Until now
+ (NSDate *)dateYearsUntil:(NSInteger)yearsUntil;
+ (NSDate *)dateMonthsUntil:(NSInteger)monthsUntil;
+ (NSDate *)dateDaysUntil:(NSInteger)daysUntil;
+ (NSDate *)dateHoursUntil:(NSInteger)hoursUntil;
+ (NSDate *)dateMinutesUntil:(NSInteger)minutesUntil;
+ (NSDate *)dateSecondsUntil:(NSInteger)secondsUntil;

// Since Instance
- (NSDate *)dateYearsSince:(NSInteger)yearsSince;
- (NSDate *)dateMonthsSince:(NSInteger)monthsSince;
- (NSDate *)dateDaysSince:(NSInteger)daysSince;
- (NSDate *)dateHoursSince:(NSInteger)hoursSince;
- (NSDate *)dateMinutesSince:(NSInteger)minutesSince;
- (NSDate *)dateSecondsSince:(NSInteger)secondsSince;

// Until Instance
- (NSDate *)dateYearsUntil:(NSInteger)yearsUntil;
- (NSDate *)dateMonthsUntil:(NSInteger)monthsUntil;
- (NSDate *)dateDaysUntil:(NSInteger)daysUntil;
- (NSDate *)dateHoursUntil:(NSInteger)hoursUntil;
- (NSDate *)dateMinutesUntil:(NSInteger)minutesUntil;
- (NSDate *)dateSecondsUntil:(NSInteger)secondsUntil;

// Date Comparisons
- (BOOL)isEqualToDateIgnoringTime:(NSDate *)date;
- (BOOL)isToday;
- (BOOL)isYesterday;
- (BOOL)isTomorrow;
- (BOOL)isThisWeek;
- (BOOL)isLastWeek;
- (BOOL)isNextWeek;
- (BOOL)isThisMonth;
- (BOOL)isLastMonth;
- (BOOL)isNextMonth;
- (BOOL)isThisYear;
- (BOOL)isLastYear;
- (BOOL)isNextYear;
- (BOOL)isPast;
- (BOOL)isFuture;

// Components
- (NSInteger)year;
- (NSInteger)month;
- (NSInteger)day;
- (NSInteger)hour;
- (NSInteger)minute;
- (NSInteger)second;

// Words
- (NSString *)distanceOfTimeInWordsFromDate:(NSDate *)fromDate;
- (NSString *)timeAgoInWords;
- (NSString *)timeUntilInWords;

@end
