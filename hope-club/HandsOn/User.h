//
//  User.h
//  HandsOn
//
//  Created by Pasquale Barilla on 28/03/2015.
//  Copyright (c) 2015 The Swan Factory, Inc. All rights reserved.
//

#import <Realm/Realm.h>
#import "Hope.h"

@class User, Hope;

@interface User : RLMObject

@property NSString *userFirstName;
@property NSString *userLastName;
@property float userID;

@property RLMArray<Hope> *userHopes;

@end
RLM_ARRAY_TYPE(User)

