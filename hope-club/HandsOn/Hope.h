//
//  Hope.h
//  HandsOn
//
//  Created by Pasquale Barilla on 28/03/2015.
//  Copyright (c) 2015 The Swan Factory, Inc. All rights reserved.
//

#import <Realm/Realm.h>

@class Hope, User;

@interface Hope : RLMObject

@property NSString *hopeTitle;
@property NSString *hopeText;
@property NSString *hopeImageURL;
@property User *hopeOwner;

@end
RLM_ARRAY_TYPE(Hope)
