//
//  CTFrameParser.h
//  CoreTextDemo
//
//  Created by xiacheng on 16/7/15.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreTextData.h"
#import "CTFrameParserConfig.h"
@interface CTFrameParser : NSObject
+(CoreTextData *)parseContent:(NSString *)content config:(CTFrameParserConfig *)config;
+(NSDictionary *)attributesWithConfig:(CTFrameParserConfig *)config;
+(CoreTextData *)parseAttributedContent:(NSMutableAttributedString *)content config:(CTFrameParserConfig *)config;
+(CoreTextData *)parseTemplateFile:(NSString *)path config:(CTFrameParserConfig *)config;

@end
