
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
- (void)setImageArry:(NSMutableArray *)imageArry {
    _imageArry = imageArry;
    [self fillImagePosition];
}
- (void)fillImagePosition {
    if (self.imageArry.count == 0) {
        return;
    }
    NSArray *lines = (NSArray *)CTFrameGetLines(self.ctFrame);
    NSInteger lineCount = [lines count];
    CGPoint lineOrigins[lineCount];
    CTFrameGetLineOrigins(self.ctFrame, CFRangeMake(0, 0), lineOrigins);
    int  imgIndex = 0;
    CoreTextImageData *imageData = self.imageArry[0];
    for (int i = 0; i<lineCount; i++) {
        if (imageData == nil) {
            break;
        }
        CTLineRef line = (__bridge CTLineRef)lines[i];
        NSArray * runObjArray = (NSArray *)CTLineGetGlyphRuns(line);
        for (id runObj in runObjArray) {
            CTRunRef run = (__bridge CTRunRef)runObj;
            NSDictionary *runAttributes = (NSDictionary *)CTRunGetAttributes(run);
            CTRunDelegateRef delegate = (__bridge CTRunDelegateRef)[runAttributes valueForKey:(id)kCTRunDelegateAttributeName];
            if (delegate == nil) {
                continue;
            }
            
            NSDictionary * metaDic = CTRunDelegateGetRefCon(delegate);
            if (![metaDic isKindOfClass:[NSDictionary class]]) {
                continue;
            }
            
            CGRect runBounds;
            CGFloat ascent;
            CGFloat descent;
            runBounds.size.width = CTRunGetTypographicBounds(run, CFRangeMake(0, 0), &ascent, &descent, NULL);
            runBounds.size.height = ascent + descent;
            
            CGFloat xOffset = CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL);
            runBounds.origin.x = lineOrigins[i].x + xOffset;
            runBounds.origin.y = lineOrigins[i].y;
            runBounds.origin.y -= descent;
            
            CGPathRef pathRef = CTFrameGetPath(self.ctFrame);
            CGRect colRect = CGPathGetBoundingBox(pathRef);
            
            CGRect delegateBounds = CGRectOffset(runBounds, colRect.origin.x, colRect.origin.y);
            
            imageData.imagePosition = delegateBounds;
            imgIndex++;
            if (imgIndex == self.imageArry.count) {
                imageData = nil;
                break;
            } else {
                imageData = self.imageArry[imgIndex];
            }
        }
    }
}
-(void)dealloc{
    if(_ctFrame != nil){
        CFRelease(_ctFrame);
        _ctFrame = nil;
    
    }
}
@end
