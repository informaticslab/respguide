//
//  DataController.m
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


#import "DataController.h"
@implementation DataController

@synthesize selectedClass, selectedRespirator, respiratorClasses;
-(id)init
{
    
    if( (self = [super init]) ) {
        
        respiratorClasses = [[NSMutableArray alloc] init];
        [self loadTestData];
        
    }
    
    return self;
    
}

-(NSArray *)getRespirators
{

    return [selectedClass.respirators copy];

}

-(NSArray *)getRespiratorClasses
{

    return [respiratorClasses copy];

}

-(void)setSelectedRespiratorClassWithIndex:(NSUInteger)index
{
    
    selectedClass = [respiratorClasses objectAtIndex:index];
    
}

-(RespiratorClass *)getSelectedRespiratorClass
{
    
    return self.selectedClass;
    
}

-(Respirator *)getSelectedRespirator
{
    
    return self.selectedRespirator;
    
}

-(void)setSelectedRespiratorWithIndex:(NSUInteger)index
{
    
    selectedRespirator = [selectedClass.respirators objectAtIndex:index];
    
}


-(void)loadTestData
{
	Respirator *resp;
    RespiratorClass *respClass;
	
    
    //add N95 respirators
    respClass = [[RespiratorClass alloc] initWithName:@"N95 Facepiece Respirators"];

	resp = [[Respirator alloc] initWithManufacturer:@"3M Company" modelNumber:@"1860" approvalNumber:@"84A-0006" contactNumber:@"888-364-3577" documentationUrl:@"http://multimedia.3m.com/mws/mediawebserver?66666UuZjcFSLXTtlxM_lX&2EVuQEcuZgVs6EVs6E666666--" hasValve:YES];
	[respClass addRespirator:resp];
	[resp release];
	
	resp = [[Respirator alloc] initWithManufacturer:@"Acme Filter Mask, Inc." modelNumber:@"YN-902C	" approvalNumber:@"84A-4366" contactNumber:@"886-2-2678-9377" documentationUrl:@"http://www.cdc.gov/niosh/npptl/topics/respirators/disp_part/pdfs/AcmeU3001.pdf" hasValve:YES];
	[respClass addRespirator:resp];
	[resp release];
	
	resp = [[Respirator alloc] initWithManufacturer:@"Cardinal Health" modelNumber:@"N95-ML" approvalNumber:@"84A-3323" contactNumber:@"800-379-9929" documentationUrl:@"http://www.cdc.gov/niosh/npptl/topics/respirators/disp_part/pdfs/84A-3323donningMKR.pdf" hasValve:YES];
	[respClass addRespirator:resp];
	[resp release];
	
	resp = [[Respirator alloc] initWithManufacturer:@"Fido Mask Company, Ltd." modelNumber:@"F510" approvalNumber:@"84A-4046" contactNumber:@"886-2-2218-1439" documentationUrl:@"http://www.cdc.gov/niosh/npptl/topics/respirators/disp_part/pdfs/FidoDonningN95.pdf" hasValve:YES];
	[respClass addRespirator:resp];
	[resp release];
	
	resp = [[Respirator alloc] initWithManufacturer:@"Inovel, LLC" modelNumber:@"1501" approvalNumber:@"84A-0013" contactNumber:@"800-421-0668" 
                                   documentationUrl:@"http://www.moldex.com/non-product/fit-instructions/respiratory/handy-strap.php" hasValve:YES ];
	[respClass addRespirator:resp];
	[resp release];
    
    [respiratorClasses addObject:respClass];
    [respClass release];
    
    //add N95 respirators
    respClass = [[RespiratorClass alloc] initWithName:@"N99 Facepiece Respirators"];
    
	resp = [[Respirator alloc] initWithManufacturer:@"Fairwin International, Ltd." modelNumber:@"N9938" approvalNumber:@"84A-4081" contactNumber:@"800-379-9929" documentationUrl:@"" hasValve:YES ];
	[respClass addRespirator:resp];
	[resp release];
    
    [respiratorClasses addObject:respClass];
    [respClass release];
    
	
}


@end
