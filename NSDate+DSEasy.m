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
    return [self dateDaysAgo:1];
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
    return [[NSDate date] dateYearsSince:yearsSince];
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
    return [[NSDate date] dateMinutesSince:minutesSince];
}

+ (NSDate *)dateSecondsSince:(NSInteger)secondsSince
{
    return [[NSDate date] dateSecondsSince:secondsSince];
}


#pragma mark - Until now

+ (NSDate *)dateYearsAgo:(NSInteger)yearsAgo
{
    return [[NSDate date] dateYearsAgo:yearsAgo];
}

+ (NSDate *)dateMonthsAgo:(NSInteger)monthsAgo
{
    return [[NSDate date] dateMonthsAgo:monthsAgo];
}

+ (NSDate *)dateDaysAgo:(NSInteger)daysAgo
{
    return [[NSDate date] dateDaysAgo:daysAgo];
}

+ (NSDate *)dateHoursAgo:(NSInteger)hoursAgo
{
    return [[NSDate date] dateHoursAgo:hoursAgo];
}

+ (NSDate *)dateMinutesAgo:(NSInteger)minutesAgo
{
    return [[NSDate date] dateMinutesAgo:minutesAgo];
}

+ (NSDate *)dateSecondsAgo:(NSInteger)secondsAgo
{
    return [[NSDate date] dateSecondsAgo:secondsAgo];
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

- (NSDate *)dateYearsAgo:(NSInteger)yearsAgo
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    offsetComponents.year = -yearsAgo;
    
    return [currentCalendar dateByAddingComponents:offsetComponents toDate:self options:0];
}

- (NSDate *)dateMonthsAgo:(NSInteger)monthsAgo
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    offsetComponents.month = -monthsAgo;
    
    return [currentCalendar dateByAddingComponents:offsetComponents toDate:self options:0];
}

- (NSDate *)dateDaysAgo:(NSInteger)daysAgo
{
    NSTimeInterval timeInterval = [self timeIntervalSinceReferenceDate] - (kDSSecondsInDay * daysAgo);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

- (NSDate *)dateHoursAgo:(NSInteger)hoursAgo
{
    NSTimeInterval timeInterval = [self timeIntervalSinceReferenceDate] - (kDSSecondsInHour * hoursAgo);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

- (NSDate *)dateMinutesAgo:(NSInteger)minutesAgo
{
    NSTimeInterval timeInterval = [self timeIntervalSinceReferenceDate] - (kDSSecondsInMinute * minutesAgo);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

- (NSDate *)dateSecondsAgo:(NSInteger)secondsAgo
{
    NSTimeInterval timeInterval = [self timeIntervalSinceReferenceDate] - secondsAgo;
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
    return ([self compare:[NSDate date]] == NSOrderedAscending);
}

- (BOOL)isFuture
{
    return ([self compare:[NSDate date]] == NSOrderedDescending);
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
    NSUInteger year = abs(components.year);
    NSUInteger month = abs(components.month);
    NSUInteger day = abs(components.day);
    NSUInteger hour = abs(components.hour);
    NSUInteger minute = abs(components.minute);
    NSUInteger second = abs(components.second);
    
    if (year == 0 && month == 0 && day == 0 && hour == 0 && minute == 0) {
        if (second < 30) {
            return @"less than a minute";
        }
        return @"1 minute";
    }
    else if (year == 0 && month == 0 && day == 0 && hour == 0) {
        if (minute == 1 && second < 30) {
            return @"1 minute";
        }
        else if (minute < 44 || (minute == 44 && second < 30)) {
            return [NSString stringWithFormat:@"%u minutes", minute];
        }
        return @"about 1 hour";
    }
    else if (year == 0 && month == 0 && day == 0) {
        if (hour == 1 && minute < 30) {
            return @"about 1 hour";
        }
        else if (hour == 23 && minute == 59 && second >= 30) {
            return @"1 day";
        }
        return [NSString stringWithFormat:@"about %u hours", hour];
    }
    else if (year == 0 && month == 0) {
        if (day == 1 && self.hour < 17) {
            return @"1 day";
        }
        return [NSString stringWithFormat:@"%u days", day];
    }
    else if (year == 0) {
        if (month == 1 && day < 29) {
            return @"about 1 month";
        }
        return [NSString stringWithFormat:@"%u months", month];
    }
    else {
        NSString *yearSuffix = @"s";
        if (year == 1)
            yearSuffix = @"";
        
        if (month <= 3) {
            return [NSString stringWithFormat:@"about %u year%@", year, yearSuffix];
        }
        else if (month >= 4 && month <= 9) {
            return [NSString stringWithFormat:@"over %u year%@", year, yearSuffix];
        }
        else {
            return [NSString stringWithFormat:@"almost %u years", year + 1];
        }
    }
}

- (NSString *)timeAgoInWords
{
    return [NSString stringWithFormat:@"%@ ago", [self distanceOfTimeInWordsFromDate:[NSDate date]]];
}

- (NSString *)timeUntilInWords
{
    return [NSString stringWithFormat:@"in %@", [self distanceOfTimeInWordsFromDate:[NSDate date]]];
}

- (NSString *)timeAgoOrUntilInWords
{
    return ([self isFuture]) ? [self timeUntilInWords] : [self timeAgoInWords];
}

@end
