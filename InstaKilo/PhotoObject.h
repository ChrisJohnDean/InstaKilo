//
//  PhotoObject.h
//  InstaKilo
//
//  Created by Chris Dean on 2018-02-28.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PhotoObject : NSObject

@property (nonatomic) UIImage *myPhoto;
@property (nonatomic) NSString *subject;
@property (nonatomic) NSString *location;

- (instancetype)initWithPhoto:(UIImage*)photo withLocation:(NSString*)location withSubject:(NSString*)subject;

@end
