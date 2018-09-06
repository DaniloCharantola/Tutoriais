//
//  OpenCVWrapper.h
//  OpenCV-Project
//
//  Created by Rodrigo Maximo on 11/07/18.
//  Copyright © 2018 Rodrigo Maximo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OpenCVWrapper : NSObject

-(UIImage *)negativeOfImage: (UIImage *) image;
-(UIImage *)grayScaleOfImage: (UIImage *) image;
-(void) function: (int) integer with: (int(^)(int, int)) block;

@end
