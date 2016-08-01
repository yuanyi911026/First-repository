//
//  CTFrameParser.m
//  CoreTextDemo
//
//  Created by xiacheng on 16/7/15.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "CTFrameParser.h"
#import "CTFrameParserConfig.h"
@implementation CTFrameParser
//返回行间距，字体，字体颜色组成的字典
+(NSDictionary *)attributesWithConfig:(CTFrameParserConfig *)config{
    CGFloat fontSize = config.fontSize;
    
    
    
    //设置字体（需要字体的尺寸，字体的型号）
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"ArialMT", fontSize, nil);
    
    
    
    
    
    //设置行间距
    CGFloat lineSpacing = config.lineSpace;
    const CFIndex kNumberOfSettings = 3;
    
    CTParagraphStyleSetting theSettings[kNumberOfSettings] = {
        {
            kCTParagraphStyleSpecifierLineSpacingAdjustment,sizeof(CGFloat),&lineSpacing
        },
        {
            kCTParagraphStyleSpecifierMaximumLineSpacing,sizeof(CGFloat),&lineSpacing
        },
        {
            kCTParagraphStyleSpecifierMinimumLineSpacing,sizeof(CGFloat),&
            lineSpacing
        }
        
    };
    //设置文章样式（包括字体颜色，字体尺寸和样式，行间距）
    CTParagraphStyleRef theParagraphRef = CTParagraphStyleCreate(theSettings, kNumberOfSettings);
   
    
    //这个字典的用法。。。？？？？？
    UIColor *textColor = config.textColor;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[(id)NSForegroundColorAttributeName] = textColor;
    dict[(id)kCTFontAttributeName] = (__bridge  id)fontRef;
    dict[(id)kCTParagraphStyleAttributeName] = (__bridge id)theParagraphRef;
    
    
    CFRelease(theParagraphRef);
    CFRelease(fontRef);
    
    return dict;
    
}
+(CoreTextData *)parseContent:(NSString *)content config:(CTFrameParserConfig *)config{
    //获得上面方法（私有方法，用这个调用）返回的字典
    NSDictionary *attributes = [self attributesWithConfig:config];
    //创建要输出的内容string,string由外界提供，样式是之前返回的字典里的样式
   
    
    
    
    //创建NSAttributedString(上一个方法只是为了创建NSAttributedString的参数)
    NSAttributedString *contentString = [[NSAttributedString alloc]initWithString:content attributes:attributes];
    
    
    
    
    //创建CTFramesetterRef实例
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)contentString);
   
    
    
    
    
    //获得要绘制的区域高度
    CGSize restrictSize = CGSizeMake(config.width, CGFLOAT_MAX);
      //获得具体的尺寸（）主要是高度
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), nil, restrictSize, nil);
    CGFloat textHeight = coreTextSize.height;
    
    
    
    
    //生成CTFrameRef实例
    CTFrameRef frame = [self creatFrameWithFramesetter:framesetter config:config height:textHeight];
    //将生成好的CTFrameRef实例和计算好的绘制高度保存到CoreTextData实例中，最后返回
    // CoreTextData实例
    CoreTextData *data = [[CoreTextData alloc]init];
    data.ctFrame = frame;
    data.height = textHeight;//frame 里面已经有height了，为什么还要传个height
    
    
    
    
    //释放内存
    CFRelease(frame);
    CFRelease(framesetter);
    
    return data;
    

}
+(CTFrameRef)creatFrameWithFramesetter:(CTFramesetterRef)framesetter
                                config:(CTFrameParserConfig*)config
                                height:(CGFloat)height{
  
    //获得绘制文本的路径区域的句柄
    CGMutablePathRef path = CGPathCreateMutable();
    //向路径添加一个矩形
    CGPathAddRect(path, nil, CGRectMake(0, 0, config.width, height));
    
    
    
//  CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, nil);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0,0), path, nil);
    CFRelease(path);
    
    return frame;
    
    
    
    
}
+(CoreTextData *)parseAttributedContent:(NSMutableAttributedString *)content config:(CTFrameParserConfig *)config{

    
    //创建CTFramesetterRef实例
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((
   CFAttributedStringRef)content);
    
    
    
    
    
    
    
    
    //获得要绘制的区域高度
    CGSize restrictSize = CGSizeMake(config.width, CGFLOAT_MAX);
    //获得具体的尺寸（）主要是高度
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), nil, restrictSize, nil);
    CGFloat textHeight = coreTextSize.height;
    
    
    
    
    //生成CTFrameRef实例
    CTFrameRef frame = [self creatFrameWithFramesetter:framesetter config:config height:textHeight];
    //将生成好的CTFrameRef实例和计算好的绘制高度保存到CoreTextData实例中，最后返回
    // CoreTextData实例
    CoreTextData *data = [[CoreTextData alloc]init];
    data.ctFrame = frame;
    data.height = textHeight;//frame 里面已经有height了，为什么还要传个height
    
    
        
    //释放内存
    CFRelease(frame);
    CFRelease(framesetter);
    
    return data;




}


+(CoreTextData *)parseTemplateFile:(NSString *)path config:(CTFrameParserConfig *)config {
    NSMutableArray *imageArry = [NSMutableArray array];
    NSAttributedString *content = [self loadTemplateFile:path config:config imageArry:imageArry];
    CoreTextData *data = [self parseContent:content config:config];
    //如何赋值
    data.imageArry = imageArry;
    
    return  data;
}
+(NSMutableAttributedString *)loadTemplateFile:(NSString *)path config:(CTFrameParserConfig *)config  imageArry:(NSMutableArray *)imageArry{
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSMutableAttributedString *result = [[NSMutableAttributedString alloc]init];
    
    if (data) {
        NSArray *arry = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if ([arry isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dict in arry) {
                NSString *type = dict[@"type"];
                if ([type isEqualToString:@"txt"]) {
                    NSAttributedString *as = [self parseAttributedContentFromNSDictionary:dict config:config];
                    [result appendAttributedString:as];
                }
                if ([type isEqualToString:@"img"]) {
                    CoreTextImageData *imageData = [[CoreTextImageData alloc]init];
                    imageData.name = dict[@"name"];
                    imageData.position = [result length];
                    [imageArry addObject:imageData];
                    //创建空白占位符，并设置它的CTRun delegate信息
                    NSAttributedString *as = [self parseImageDataFromNSDictionary:dict config:config];//??config 怎么设置
                    [result appendAttributedString:as];
                }
        
            }
    
        }
    }
    return result;
}
// 创建每一段的NSAttributedString
+(NSAttributedString *)parseAttributedContentFromNSDictionary:(NSDictionary *)dict
                                                       config:(CTFrameParserConfig *)config {
    NSMutableDictionary *attributes = [self attributesWithConfig:config];
    //set color
    UIColor *color = [self colorFromTemplate:dict[@"color"]];
    if  (color) {
        attributes[NSForegroundColorAttributeName] = color;
    }
    //set font size
    CGFloat fontSize = [dict[@"size"] floatValue];
    if (fontSize > 0) {
        CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"ArialMT", fontSize, nil);
        attributes[(id)kCTFontAttributeName] = (__bridge id _Nullable)(fontRef);
        CFRelease(fontRef);
    }
    NSString *content = dict[@"content"];
    return  [[NSAttributedString alloc]initWithString:content attributes:attributes];
}

+(UIColor *)colorFromTemplate:(NSString *)name {
    if ([name isEqualToString:@"blue"]) {
        return [UIColor blueColor];
    } else if ([name isEqualToString:@"red"]) {
        return [UIColor redColor];
    } else if ([name isEqualToString:@"black"]) {
        return [UIColor blackColor];
    } else {
        return nil;
    }
}
+ (NSAttributedString *)parseImageDataFromNSDictionary:(NSDictionary *)dict config:(CTFrameParserConfig *)config {
    

    return nil;
}

//+(CTFrameRef)createFrameWithFramesetter:(CTFramesetterRef)framesetter
//                                 config:(CTFrameParserConfig *)config
//                                 height:(CGFloat)height {
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path, nil, CGRectMake(0, 0, config.width, height));
//    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, nil);
//    CFRelease(path);
//    return  frame;
//}
@end

