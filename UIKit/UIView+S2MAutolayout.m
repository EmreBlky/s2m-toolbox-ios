//
//  UIView+S2MAutolayout.m
//
//
//  Created by François Benaiteau on 5/28/13.
//  Copyright (c) 2013 SinnerSchrader Mobile. All rights reserved.
//

#import "UIView+S2MAutolayout.h"

@implementation UIView (S2MAutolayout)


-(NSArray*)s2m_addPositionAndSizeOfSuperViewConstraint
{
    NSMutableArray* constraints = [[NSMutableArray alloc] init];
    NSArray* centerConstraints = [self s2m_addCenterInSuperViewConstraint];
    if (centerConstraints) {
        [constraints addObjectsFromArray:centerConstraints];
    }
    NSLayoutConstraint* constraint = [self s2m_addFullHeightWithSuperViewConstraint];
    if (constraint) {
        [constraints addObject:constraint];
    }

    constraint = [self s2m_addFullWidthWithSuperViewConstraint];
    if (constraint) {
        [constraints addObject:constraint];
    }

    return constraints;
}

#pragma mark - Position

-(NSArray*)s2m_addCenterInSuperViewConstraint
{
    NSMutableArray* constraints = [[NSMutableArray alloc] init];

    NSLayoutConstraint* constraint = [self s2m_addCenterXInSuperViewConstraint];
    if (constraint) {
        [constraints addObject:constraint];
    }
    
    constraint = [self s2m_addCenterYInSuperViewConstraint];
    if (constraint) {
        [constraints addObject:constraint];
    }
    return constraints;
}

-(NSLayoutConstraint*)s2m_addCenterYInSuperViewConstraint
{
    if (!self.superview) {
        return nil;
    }
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint* centerYConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                         attribute:NSLayoutAttributeCenterY
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.superview
                                                                         attribute:NSLayoutAttributeCenterY
                                                                        multiplier:1.0
                                                                          constant:0];
    

    [self.superview addConstraint:centerYConstraint];
    return centerYConstraint;
}

-(NSLayoutConstraint*)s2m_addCenterXInSuperViewConstraint
{
    if (!self.superview) {
        return nil;
    }
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint* centerXconstraint = [NSLayoutConstraint constraintWithItem:self
                                                                         attribute:NSLayoutAttributeCenterX
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.superview
                                                                         attribute:NSLayoutAttributeCenterX
                                                                        multiplier:1.0
                                                                          constant:0];
    
    
    [self.superview addConstraint:centerXconstraint];
    return centerXconstraint;
}


#pragma mark - Size

-(NSLayoutConstraint*)s2m_addFullWidthWithSuperViewConstraint
{
    if (!self.superview) {
        return nil;
    }
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint* fullWithConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                            attribute:NSLayoutAttributeWidth
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.superview
                                                                            attribute:NSLayoutAttributeWidth
                                                                           multiplier:1.0
                                                                             constant:0];
    
    [self.superview addConstraint:fullWithConstraint];
    return fullWithConstraint;
}

-(NSLayoutConstraint*)s2m_addFullHeightWithSuperViewConstraint
{
    if (!self.superview) {
        return nil;
    }
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint* fullHeightConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                            attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.superview
                                                                            attribute:NSLayoutAttributeHeight
                                                                           multiplier:1.0
                                                                             constant:0];
    
    [self.superview addConstraint:fullHeightConstraint];
    return fullHeightConstraint;
}

@end
