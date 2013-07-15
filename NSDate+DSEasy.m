//
//  NSDate+DSEasy.m
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

#define kDSSecondsInMinute  60.0
#define kDSSecondsInHour    3600.0
#define kDSSecondsInDay     86400.0

#import "NSDate+DSEasy.h"

@implementation NSDate (DSEasy)

+ (NSDate *)dateYesterday
{
    return [self dateDaysUntil:1];
}

+ (NSDate *)dateTomorrow
{
    return [self dateDaysSince:1];
}

+ (NSDate *)dateAtBeginningOfDay
{
    return [[NSDate date] dateAtBeginningOfDay];
}

+ (NSDate *)dateAtEndOfDay
{
    return [[NSDate date] dateAtEndOfDay];
}

+ (NSDate *)dateAtMidnight
{
    return [[NSDate date] dateAtMidnight];
}

+ (NSDate *)dateAtBeginningOfHour
{
    return [[NSDate date] dateAtBeginningOfHour];
}

+ (NSDate *)dateAtEndOfHour
{
    return [[NSDate date] dateAtEndOfHour];
}

- (NSDate *)dateAtBeginningOfDay
{
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
    return [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
}

- (NSDate *)dateAtEndOfDay
{
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
    dateComponents.hour = 23;
    dateComponents.minute = 59;
    dateComponents.second = 59;
    
    return [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
}

- (NSDate *)dateAtMidnight
{
    return [self dateAtBeginningOfDay];
}

- (NSDate *)dateAtBeginningOfHour
{
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit fromDate:self];
    
    return [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
}

- (NSDate *)dateAtEndOfHour
{
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit fromDate:self];
    dateComponents.minute = 59;
    dateComponents.second = 59;
    
    return [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
}


#pragma mark - Since now

+ (NSDate *)dateYearsSince:(NSInteger)yearsSince
{
    return [[NSDate date] dateYearsUntil:yearsSince];
}

+ (NSDate *)dateMonthsSince:(NSInteger)monthsSince
{
    return [[NSDate date] dateMonthsSince:monthsSince];
}

+ (NSDate *)dateDaysSince:(NSInteger)daysSince
{
    return [[NSDate date] dateDaysSince:daysSince];
}

+ (NSDate *)dateHoursSince:(NSInteger)hoursSince
{
    return [[NSDate date] dateHoursSince:hoursSince];
}

+ (NSDate *)dateMinutesSince:(NSInteger)minutesSince
{
    return [[NSDate date] dateMinutesUntil:minutesSince];
}

+ (NSDate *)dateSecondsSince:(NSInteger)secondsSince
{
    return [[NSDate date] dateSecondsSince:secondsSince];
}


#pragma mark - Until now

+ (NSDate *)dateYearsUntil:(NSInteger)yearsUntil
{
    return [[NSDate date] dateYearsUntil:yearsUntil];
}

+ (NSDate *)dateMonthsUntil:(NSInteger)monthsUntil
{
    return [[NSDate date] dateMonthsUntil:monthsUntil];
}

+ (NSDate *)dateDaysUntil:(NSInteger)daysUntil
{
    return [[NSDate date] dateDaysUntil:daysUntil];
}

+ (NSDate *)dateHoursUntil:(NSInteger)hoursUntil
{
    return [[NSDate date] dateHoursUntil:hoursUntil];
}

+ (NSDate *)dateMinutesUntil:(NSInteger)minutesUntil
{
    return [[NSDate date] dateMinutesUntil:minutesUntil];
}

+ (NSDate *)dateSecondsUntil:(NSInteger)secondsUntil
{
    return [[NSDate date] dateSecondsUntil:secondsUntil];
}


#pragma mark - Since Instance

- (NSDate *)dateYearsSince:(NSInteger)yearsSince
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    offsetComponents.year = yearsSince;
    
    return [currentCalendar dateByAddingComponents:offsetComponents toDate:self options:0];
}

- (NSDate *)dateMonthsSince:(NSInteger)monthsSince
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    offsetComponents.month = monthsSince;
    
    return [currentCalendar dateByAddingComponents:offsetComponents toDate:self options:0];
}

- (NSDate *)dateDaysSince:(NSInteger)daysSince
{
    NSTimeInterval timeInterval = [self timeIntervalSinceReferenceDate] + (kDSSecondsInDay * daysSince);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

- (NSDate *)dateHoursSince:(NSInteger)hoursSince
{
    NSTimeInterval timeInterval = [self timeIntervalSinceReferenceDate] + (kDSSecondsInHour * hoursSince);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

- (NSDate *)dateMinutesSince:(NSInteger)minutesSince
{
    NSTimeInterval timeInterval = [self timeIntervalSinceReferenceDate] + (kDSSecondsInMinute * minutesSince);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

- (NSDate *)dateSecondsSince:(NSInteger)secondsSince
{
    NSTimeInterval timeInterval = [self timeIntervalSinceReferenceDate] + secondsSince;
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}


#pragma mark - Until Instance

- (NSDate *)dateYearsUntil:(NSInteger)yearsUntil
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    offsetComponents.year = -yearsUntil;
    
    return [currentCalendar dateByAddingComponents:offsetComponents toDate:self options:0];
}

- (NSDate *)dateMonthsUntil:(NSInteger)monthsUntil
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    offsetComponents.month = -monthsUntil;
    
    return [currentCalendar dateByAddingComponents:offsetComponents toDate:self options:0];
}

- (NSDate *)dateDaysUntil:(NSInteger)daysUntil
{
    NSTimeInterval timeInterval = [self timeIntervalSinceReferenceDate] - (kDSSecondsInDay * daysUntil);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

- (NSDate *)dateHoursUntil:(NSInteger)hoursUntil
{
    NSTimeInterval timeInterval = [self timeIntervalSinceReferenceDate] - (kDSSecondsInHour * hoursUntil);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

- (NSDate *)dateMinutesUntil:(NSInteger)minutesUntil
{
    NSTimeInterval timeInterval = [self timeIntervalSinceReferenceDate] - (kDSSecondsInMinute * minutesUntil);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

- (NSDate *)dateSecondsUntil:(NSInteger)secondsUntil
{
    NSTimeInterval timeInterval = [self timeIntervalSinceReferenceDate] - secondsUntil;
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}


#pragma mark - Date Comparisons

- (BOOL)isEqualToDateIgnoringTime:(NSDate *)date
{
    NSDateComponents *selfComponents = [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
    NSDateComponents *otherComponents = [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:date];
    
    return [selfComponents isEqual:otherComponents];
}

- (BOOL)isToday
{
    return [self isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL)isYesterday
{
    return [self isEqualToDateIgnoringTime:[NSDate dateYesterday]];
}

- (BOOL)isTomorrow
{
    return [self isEqualToDateIgnoringTime:[NSDate dateTomorrow]];
}

- (BOOL)isThisWeek
{
    NSDateComponents *dateDifferenceComponents = [[NSCalendar currentCalendar] components:NSWeekCalendarUnit fromDate:[NSDate date] toDate:self options:0];
    
    return (dateDifferenceComponents.week == 0);
}

- (BOOL)isLastWeek
{
    NSDateComponents *dateDifferenceComponents = [[NSCalendar currentCalendar] components:NSWeekCalendarUnit fromDate:[NSDate date] toDate:self options:0];
    
    return (dateDifferenceComponents.week == -1);
}

- (BOOL)isNextWeek
{
    NSDateComponents *dateDifferenceComponents = [[NSCalendar currentCalendar] components:NSWeekCalendarUnit fromDate:[NSDate date] toDate:self options:0];
    
    return (dateDifferenceComponents.week == 1);
}

- (BOOL)isThisMonth
{
    NSDateComponents *dateDifferenceComponents = [[NSCalendar currentCalendar] components:NSMonthCalendarUnit fromDate:[NSDate date] toDate:self options:0];
    
    return (dateDifferenceComponents.month == 0);
}

- (BOOL)isLastMonth
{
    NSDateComponents *dateDifferenceComponents = [[NSCalendar currentCalendar] components:NSMonthCalendarUnit fromDate:[NSDate date] toDate:self options:0];
    
    return (dateDifferenceComponents.month == -1);
}

- (BOOL)isNextMonth
{
    NSDateComponents *dateDifferenceComponents = [[NSCalendar currentCalendar] components:NSMonthCalendarUnit fromDate:[NSDate date] toDate:self options:0];
    
    return (dateDifferenceComponents.month == 1);
}

- (BOOL)isThisYear
{
    NSDateComponents *dateDifferenceComponents = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date] toDate:self options:0];
    
    return (dateDifferenceComponents.year == 0);
}

- (BOOL)isLastYear
{
    NSDateComponents *dateDifferenceComponents = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date] toDate:self options:0];
    
    return (dateDifferenceComponents.year == -1);
}

- (BOOL)isNextYear
{
    NSDateComponents *dateDifferenceComponents = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date] toDate:self options:0];
    
    return (dateDifferenceComponents.year == 1);
}

- (BOOL)isPast
{
    return ([self compare:[NSDate date]] == NSOrderedDescending);
}

- (BOOL)isFuture
{
    return ([self compare:[NSDate date]] == NSOrderedAscending);
}


#pragma mark - Components

- (NSInteger)year
{
    return [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:self].year;
}

- (NSInteger)month
{
    return [[NSCalendar currentCalendar] components:NSMonthCalendarUnit fromDate:self].month;
}

- (NSInteger)day
{
    return [[NSCalendar currentCalendar] components:NSDayCalendarUnit fromDate:self].day;
}

- (NSInteger)hour
{
    return [[NSCalendar currentCalendar] components:NSHourCalendarUnit fromDate:self].hour;
}

- (NSInteger)minute
{
    return [[NSCalendar currentCalendar] components:NSMinuteCalendarUnit fromDate:self].minute;
}

- (NSInteger)second
{
    return [[NSCalendar currentCalendar] components:NSSecondCalendarUnit fromDate:self].second;
}


#pragma mark - Words

- (NSString *)distanceOfTimeInWordsFromDate:(NSDate *)fromDate
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:fromDate toDate:self options:0];
    
    if (components.year == 0 && components.month == 0 && components.day == 0 && components.hour == 0 && components.minute == 0) {
        if (components.second < 30) {
            return @"less than a minute";
        }
        return @"1 minute";
    }
    else if (components.year == 0 && components.month == 0 && components.day == 0 && components.hour == 0) {
        if (components.minute == 1 && components.second < 30) {
            return @"1 minute";
        }
        else if (components.minute < 44 || (components.minute == 44 && components.second < 30)) {
            return [NSString stringWithFormat:@"%ul minutes", components.minute];
        }
        return @"about 1 hour";
    }
    else if (components.year == 0 && components.month == 0 && components.day == 0) {
        if (components.hour == 1 && components.minute < 30) {
            return @"about 1 hour";
        }
        else if (components.hour == 23 && components.minute == 59 && components.second >= 30) {
            return @"1 day";
        }
        return [NSString stringWithFormat:@"about %ul hours", components.hour];
    }
    else if (components.year == 0 && components.month == 0) {
        if (components.day == 1 && self.hour < 17) {
            return @"1 day";
        }
        return [NSString stringWithFormat:@"%ul days", components.day];
    }
    else if (components.year == 0) {
        if (components.month == 1 && components.day < 29) {
            return @"about 1 month";
        }
        return [NSString stringWithFormat:@"%ul months", components.month];
    }
    else {
        NSString *yearSuffix = @"s";
        if (components.year == 1)
            yearSuffix = @"";
        
        if (components.month <= 3) {
            return [NSString stringWithFormat:@"about %ul year%@", components.year, yearSuffix];
        }
        else if (components.month >= 4 && components.month <= 9) {
            return [NSString stringWithFormat:@"over %ul year%@", components.year, yearSuffix];
        }
        else {
            return [NSString stringWithFormat:@"almost %ul years", components.year + 1];
        }
    }
}

- (NSString *)timeAgoInWords
{
    return [NSString stringWithFormat:@"%@ ago", [self distanceOfTimeInWordsFromDate:[NSDate date]]];
}


@end
