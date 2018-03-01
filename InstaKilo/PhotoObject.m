//
//  PhotoObject.m
//  InstaKilo
//
//  Created by Chris Dean on 2018-02-28.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import "PhotoObject.h"

@implementation PhotoObject

- (instancetype)initWithPhoto:(UIImage*)photo withLocation:(NSString*)location withSubject:(NSString*)subject
{
    self = [super init];
    if (self) {
        _myPhoto = photo;
        _location = location;
        _subject = subject;
    }
    return self;
}

@end
