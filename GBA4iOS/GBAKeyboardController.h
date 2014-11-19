//
//  GBAKeyboardController.h
//  GBA4iOS
//
//  Created by Mike Bignell on 17/11/2014.
//  Copyright (c) 2014 Riley Testut. All rights reserved.
//

#import "GBAControllerInput.h"
#import "LMBTControllerView.h"

@interface GBAKeyboardController : LMBTControllerView <GBAControllerInput>

@property (weak, nonatomic) id<GBAControllerInputDelegate> delegate;

@end
