//
//  OpenCVWrapper.m
//  OpenCV-Project
//
//  Created by Rodrigo Maximo on 11/07/18.
//  Copyright © 2018 Rodrigo Maximo. All rights reserved.
//

#import "OpenCVWrapper.h"
#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

using namespace cv;

@implementation OpenCVWrapper

-(UIImage *)negativeOfImage: (UIImage *) image {
    Mat matImage;
    
    // converting the uiimage to mat
    UIImageToMat(image, matImage);
    
    // just perform the negative if the image is in grayscale
    if (matImage.elemSize() == 1) {
        matImage = 255 - matImage;
    }
    
    // converting the final mat to an uiimage again
    UIImage *finalImage = MatToUIImage(matImage);
    
    return finalImage;
}

-(UIImage *)grayScaleOfImage: (UIImage *) image {
    Mat matImage;
    
    // converting the image to mat
    UIImageToMat(image, matImage);
    
    // just try to convert if the image is not in gray scale
    if (matImage.elemSize() != 1) {
        cvtColor(matImage, matImage, COLOR_BGR2GRAY);
    }
    
    // converting the final mat to an uiimage again
    UIImage *finalImage = MatToUIImage(matImage);
    
    return finalImage;
}

// metodo com closure como parametro
-(void) function: (int) integer with: (int(^)(int first, int)) block {
    
}

-(void) methodToTest {
    
    // variavel bloco
    int(^block)(int, int) = ^(int a, int b) {
        return a * b;
    };
    
    // typedef para facilitar leitura de blocos
    typedef int (^BlockType) (int, int);
    BlockType block2 = block;
    
    // chamada de metodo com implementacao do bloco (closure)
    [self function:20 with:^int(int a, int b) {
        return a / b;
    }];
    
    // chamada do metodo com variavel bloco
    [self function:20 with:block];
    [self function:20 with:block2];
}

@end
