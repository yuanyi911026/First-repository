
//
//  CoreTextData.m
//  CoreTextDemo
//
//  Created by xiacheng on 16/7/15.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "CoreTextData.h"
#import "CoreTextImageData.h"
@implementation CoreTextData
-(void)setCtFrame:(CTFrameRef)ctFrame{
    if(_ctFrame != ctFrame){
        if(_ctFrame != nil){
            
            CFRelease(_ctFrame);
        }
    
        CFRetain(ctFrame);//为什么计数加一
        _ctFrame = ctFrame;
    
    }
}
-(void)dealloc{
    if(_ctFrame != nil){
        CFRelease(_ctFrame);
        _ctFrame = nil;
    
    }
}
@end
