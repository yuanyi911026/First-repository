//
//  CTDDisplayView.m
//  CoreTextDemo
//
//  Created by xiacheng on 16/7/11.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "CTDDisplayView.h"
#import <CoreText/CoreText.h>

@implementation CTDDisplayView

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    //获取画板上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //将坐标系翻转，转成基于UIKIT的坐标系（原点在左上角）
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
//    //创建绘制区域
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddEllipseInRect(path, nil, self.bounds);
//    //CGPathAddRect(path, nil, self.bounds);
//    //
//    NSAttributedString *attString = [[NSAttributedString alloc]initWithString:@"hello ,world!!"];
//    
//    
//    CTFramesetterRef framesetter =  CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
//    CTFrameRef  frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, [attString length]), path, nil);
//    //
//    CTFrameDraw(frame, context);
//    //u a
//    CFRelease(frame);
//    CFRelease(path);
//    CFRelease(framesetter);
    
    if(self.data){
    
        CTFrameDraw(self.data.ctFrame, context);
        for (CoreTextImageData * imageData in self.data.imageArry) {
            UIImage *image = [UIImage imageNamed:imageData.name];
            if (image) {
                CGContextDrawImage(context, imageData.imagePosition, image.CGImage);
            }
        }
    }
}

@end
