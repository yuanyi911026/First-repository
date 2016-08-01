//
//  ViewContro ller.m
//  CoreTextDemo
//
//  Created by xiacheng on 16/7/11.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "ViewController.h"
#import "CTFrameParserConfig.h"
#import "CoreTextData.h"
#import "CTFrameParser.h"
#import "CTDDisplayView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
/*
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc]init];
    config.textColor = [UIColor blueColor];
    config.width = self.ctView.width;
    
//    CoreTextData *data = [CTFrameParser parseContent:@"记忆这玩意儿真是不可思议。当我身历其境时，我是一点儿也不去留意那风景。当时我并不觉得它会让人留下深刻的印象，也绝没料到在十八年后，我可能将那一草一木记得这么清楚。老实说，那时候的我根本不在意什么风景。我只关心我自己，关心走在我身旁的这个美人，关心我和她之间的关系，然后再回头来关心自己。不管见到什么、感受到什么、想到什么，结果总会像飞镖一样，又飞到自己这一边来，当时正是这样一个时代。再说，我那时又在谈恋爱，那场恋爱谈得也着实辛苦。我根本就没有气力再去留意周遭的风景。然而，现在率先浮现在我的脑海里的，却是那一片草原风光。草香、挟着些微寒意的风、山的线、狗吠声，率先浮现的正是这些，清清楚楚地。也因为实在太清楚了，让人觉得仿佛只要一伸手，便能用手指将它们一一描绘出来。但草原上不见人影。一个人也没有。没有直子，也没有我。我不知道我们究竟上哪儿去了。为什么会突然发生这种事呢？曾经那么在意的，还看她、我、我的世界，究竟都上哪儿去了？对了，我现在甚至无法立即记忆起直子的脸来，我能想到的，就是一幕不见人影的背景而已。　当然，只要肯花时间我还是可以忆起她的脸。小小的冰冷的手、一头触感柔顺光滑的长发、软而圆的耳垂、耳垂下方一颗小小的痣、冬天里常穿的那件骆驼牌外套、老爱凝视对方的双眼发问的怪癖、有事没事便发颤的嗓音（就像是站在刮着强风的山坡上说话一样），把这些印象统统集合起来的话，她的脸便自然而然地显现出来了。最先显现出的是她的侧脸。这大约是因为我和直子总是并肩走在一块的关系罢。所以先让我忆起的常是她的侧脸。然后，她会转向我这边，轻轻地笑着，微微地歪着头开始说话，一边凝视着我的眼睛。仿佛要在清澈的泉底寻找一晃而过的小鱼似的。不过，我得花上一段时间才能如此这般地忆起直子的脸。而且，随着岁月的消逝，时间花得愈来愈长，尽管很叫人感到悲哀，但却是千真万确。最初只要五秒钟我便能想起来的，渐渐地变成十秒、三十秒，然后是一分钟。就像是黄昏时的黑影，愈拉愈长。最后大概就会被黑暗给吞噬了罢？" config:config];
    NSString  *context = @"记忆这玩意儿真是不可思议。当我身历其境时，我是一点儿也不去留意那风景。当时我并不觉得它会让人留下深刻的印象，也绝没料到在十八年后，我可能将那一草一木记得这么清楚。老实说，那时候的我根本不在意什么风景。我只关心我自己，关心走在我身旁的这个美人，关心我和她之间的关系，然后再回头来关心自己。不管见到什么、感受到什么、想到什么，结果总会像飞镖一样，又飞到自己这一边来，当时正是这样一个时代。再说，我那时又在谈恋爱，那场恋爱谈得也着实辛苦。我根本就没有气力再去留意周遭的风景。然而，现在率先浮现在我的脑海里的，却是那一片草原风光。草香、挟着些微寒意的风、山的线、狗吠声，率先浮现的正是这些，清清楚楚地。也因为实在太清楚了，让人觉得仿佛只要一伸手，便能用手指将它们一一描绘出来。但草原上不见人影。";
    NSDictionary  *attr = [CTFrameParser  attributesWithConfig:config];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:context attributes:attr];
    
//    [attributedString addAttribute:kCTForegroundColorAttributeName value:(id)[UIColor redColor].CGColor range:NSMakeRange(0,5)];
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0,10)];
    
    
    CoreTextData *data = [CTFrameParser parseAttributedContent:attributedString config:config];
    
    self.ctView.data = data;
    self.ctView.height = data.height;
    self.ctView.backgroundColor = [UIColor yellowColor];
*/
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc]init];
    config.width = self.ctView.width;
    NSString *path = [[NSBundle mainBundle]pathForResource:@"content" ofType:@"json"];
    CoreTextData *data = [CTFrameParser parseTemplateFile:path config:config];
    self.ctView.data = data;
    self.ctView.height = data.height;
    self.ctView.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
