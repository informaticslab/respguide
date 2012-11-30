//
//  Respirator.h
//  respguide
//
//
//  Copyright 2011  U.S. Centers for Disease Control and Prevention
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software 
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//


#import <Foundation/Foundation.h>


@interface Respirator : NSObject {
	NSString *manufacturer;
	NSString *contactNumber;
	NSString *modelNumber;
	NSString *approvalNumber;
    NSString *documentationUrl;
	BOOL hasValve;

}

@property(nonatomic, retain) NSString *manufacturer;
@property(nonatomic, retain) NSString *contactNumber;
@property(nonatomic, retain) NSString *modelNumber;
@property(nonatomic, retain) NSString *approvalNumber;
@property(nonatomic, retain) NSString *documentationUrl;
@property BOOL hasValve;

-(id)initWithManufacturer:(NSString *)newManufacturer 
              modelNumber:(NSString *)newModelNumber 
           approvalNumber:(NSString *)newApprovalNumber
            contactNumber:(NSString *)newContactNumber
        documentationUrl:(NSString *)newDocumentationUrl
                 hasValve:(BOOL)newHasValue;



@end
