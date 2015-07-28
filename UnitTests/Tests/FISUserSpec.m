//
//  FISUserSpec.m
//  facepad
//
//  Created by Tom OMalley on 7/21/15.
//  Copyright 2015 The Flatiron School. All rights reserved.
//

#import "Specta.h"
#import "FISUser.h"
#import "FISImagePost.h"
#import "FISTextPost.h"


SpecBegin(FISUser)

describe(@"FISUser", ^{
    
    __block FISUser *testUser;
    __block FISImagePost *imagePost1;
    __block FISTextPost *textPost1;
    
    beforeAll(^{
        testUser = [[FISUser alloc] init];
        testUser.username = @"jmburgess";
        testUser.profilePic = [UIImage imageNamed:@"joe-burgess"];
        testUser.cover = [UIImage imageNamed:@"coverimage"];
        
        textPost1 = [[FISTextPost alloc] init];
        textPost1.textContent = @"Excited for the first day of school!";
        textPost1.user = testUser;
        
        imagePost1 = [[FISImagePost alloc] init];
        imagePost1.imageContent = [UIImage imageNamed:@"flying"];
        imagePost1.user = testUser;
        
        testUser.posts = [@[textPost1, imagePost1] mutableCopy];
    });
    
    it(@"has properties for username, profile picture, cover image, and posts, with no extra stuff modifying their setters",
       ^{
           expect([testUser respondsToSelector:@selector(username)]).to.beTruthy;
           expect(testUser.username).to.beKindOf([NSString class]);
           expect(testUser.username).to.equal(@"jmburgess");
           
           expect([testUser respondsToSelector:@selector(profilePic)]).to.beTruthy;
           expect(testUser.profilePic).to.beKindOf([UIImage class]);
           expect(testUser.profilePic).to.equal([UIImage imageNamed:@"joe-burgess"]);
           
           expect([testUser respondsToSelector:@selector(cover)]).to.beTruthy;
           expect(testUser.cover).to.beKindOf([UIImage class]);
           expect(testUser.cover).to.equal([UIImage imageNamed:@"coverimage"]);
           
           expect([testUser respondsToSelector:@selector(posts)]).to.beTruthy;
           expect(testUser.posts).to.beKindOf([NSMutableArray class]);
           expect(testUser.posts).to.equal([@[textPost1, imagePost1] mutableCopy]);
       });
});

SpecEnd
