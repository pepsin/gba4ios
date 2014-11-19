//
//  GBAKeyboardController.m
//  GBA4iOS
//
//  Created by Mike Bignell on 17/11/2014.
//  Copyright (c) 2014 Riley Testut. All rights reserved.
//

#import "GBAKeyboardController.h"

@interface GBAKeyboardController () <iCadeEventDelegate>

@end

@implementation GBAKeyboardController

#pragma mark - Init

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self initialize];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self initialize];
    }
    
    return self;
}

- (void)initialize
{
    self.backgroundColor = [UIColor clearColor];
    // For testing:
    //self.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.33333f];
    self.eventDelegate = self;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)]];
}

#pragma mark - iCadeEventDelegate Methods

- (void)buttonDown:(iCadeState)button
{
    NSSet *pressedButtons = [NSSet setWithObject:@([self controllerButtonForButton:button])];
    
    [self.delegate controllerInput:self didPressButtons:pressedButtons];
}

- (void)buttonUp:(iCadeState)button
{
    NSSet *releasedButtons = [NSSet setWithObject:@([self controllerButtonForButton:button])];
    
    [self.delegate controllerInput:self didReleaseButtons:releasedButtons];
}

#pragma mark - Private Methods

- (IBAction)viewTapped:(id)sender
{
    // We always want to show the menu if we're tapped!
    [self.delegate controllerInputDidPressMenuButton:self];
}

- (GBAControllerButton)controllerButtonForButton:(iCadeState)button
{
    /*
     UP ON,OFF  = w,e
     RT ON,OFF  = d,c
     DN ON,OFF  = x,z
     LT ON,OFF  = a,q
     A  ON,OFF  = y,t
     B  ON,OFF  = h,r
     C  ON,OFF  = u,f
     D  ON,OFF  = j,n
     E  ON,OFF  = i,m
     F  ON,OFF  = k,p
     G  ON,OFF  = o,g
     H  ON,OFF  = l,v
     */
    
    switch (button)
    {
        case iCadeJoystickUp:
            return GBAControllerButtonUp;
        case iCadeJoystickRight:
            return GBAControllerButtonRight;
        case iCadeJoystickDown:
            return GBAControllerButtonDown;
        case iCadeJoystickLeft:
            return GBAControllerButtonLeft;
        case iCadeButtonA:
            return GBAControllerButtonStart;
        case iCadeButtonB:
            return GBAControllerButtonB;
        case iCadeButtonC:
            return GBAControllerButtonA;
        case iCadeButtonD:
            return GBAControllerButtonSelect;
        case iCadeButtonE:
            return GBAControllerButtonL;
        case iCadeButtonF:
            return GBAControllerButtonR;
        case iCadeButtonG:
            return GBAControllerButtonMenu;
        case iCadeButtonH:
            return GBAControllerButtonFastForward;
            
        default:
        case iCadeJoystickNone:
            return GBAControllerButtonMenu;
            break;
    }
}

@end
