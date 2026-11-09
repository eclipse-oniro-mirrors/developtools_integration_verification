/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { TabSegmentButtonV2, SegmentButtonV2Items, ColorMetrics } from '@kit.ArkUI';

@Entry
@ComponentV2
struct SegmentButtonV23310 {
  @Local selectedIndex: number = 0;
  @Local buttonItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '按钮1' },
    { text: '按钮2' },
    { text: '按钮3' },
    { text: '按钮4' }
  ]);
  @Local buttonbackgroundcolorInfo: string = '默认颜色';
  @Local itemSelectedBackgroundColorValue: ColorMetrics | undefined = undefined;

  build() {
    Row() {
      Column() {
        Text('SegmentButtonV2 - buttonBackgroundColor测试')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('TabSegmentButtonV2 页签型分段按钮')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ bottom: 20 })

        Text(`当前颜色：${this.buttonbackgroundcolorInfo}`)
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 20 })

        TabSegmentButtonV2({
          items: this.buttonItems,
          selectedIndex: this.selectedIndex,
          itemSelectedBackgroundColor: this.itemSelectedBackgroundColorValue
        })
          .id('segmentButton')
          .width('100%')
          .margin({ bottom: 30 })

        Text('参数配置')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        Button('buttonbackgroundColor接口')
          .id('buttonbackgroundColorButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            // 接口已启用
          })

        Button('红色')
          .id('redButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 5 })
          .onClick(() => {
            this.itemSelectedBackgroundColorValue = ColorMetrics.rgba(1000, 0, 0, 1000);
            this.buttonbackgroundcolorInfo = '红色';
          })

        Button('绿色')
          .id('greenButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 5 })
          .onClick(() => {
            this.itemSelectedBackgroundColorValue = ColorMetrics.rgba(0, 1000, 0, 1000);
            this.buttonbackgroundcolorInfo = '绿色';
          })

        Button('蓝色')
          .id('blueButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 5 })
          .onClick(() => {
            this.itemSelectedBackgroundColorValue = ColorMetrics.rgba(0, 0, 1000, 1000);
            this.buttonbackgroundcolorInfo = '蓝色';
          })

        Button('黄色')
          .id('yellowButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 5 })
          .onClick(() => {
            this.itemSelectedBackgroundColorValue = ColorMetrics.rgba(1000, 1000, 0, 1000);
            this.buttonbackgroundcolorInfo = '黄色';
          })

        Button('青色')
          .id('cyanButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 5 })
          .onClick(() => {
            this.itemSelectedBackgroundColorValue = ColorMetrics.rgba(0, 1000, 1000, 1000);
            this.buttonbackgroundcolorInfo = '青色';
          })

        Button('品红色')
          .id('magentaButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 5 })
          .onClick(() => {
            this.itemSelectedBackgroundColorValue = ColorMetrics.rgba(1000, 0, 1000, 1000);
            this.buttonbackgroundcolorInfo = '品红色';
          })

        Button('白色')
          .id('whiteButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 5 })
          .onClick(() => {
            this.itemSelectedBackgroundColorValue = ColorMetrics.rgba(1000, 1000, 1000, 1000);
            this.buttonbackgroundcolorInfo = '白色';
          })

        Button('半透明红色')
          .id('semiTransparentRedButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.itemSelectedBackgroundColorValue = ColorMetrics.rgba(1000, 0, 0, 500);
            this.buttonbackgroundcolorInfo = '半透明红色';
          })

        Button('重置')
          .id('resetButton')
          .width('80%')
          .height(40)
          .margin({ bottom: 20 })
          .onClick(() => {
            this.itemSelectedBackgroundColorValue = undefined;
            this.buttonbackgroundcolorInfo = '默认颜色';
            this.selectedIndex = 0;
          })

        Text('预期：分段按钮背景按照预设颜色正常显示\nAlpha是负责设置颜色透明度的。透明度的调节功能正常\n在拉满Alpha值的情况下，\n1. **等量混合**：如果红、绿、蓝三种颜色的光线以相等的比例混合，会得到白色光。\n2. **两两混合**：\n   - 红光和绿光混合会产生黄光。\n   - 绿光和蓝光混合会产生青光（或称为蓝绿色）。\n   - 蓝光和红光混合会产生品红色（或称为洋红色）。\n3、**单独设置一种颜色**，\n都能正常显示自定义的颜色')
          .fontSize(14)
          .fontColor('#FF6600')
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10 })
          .width('100%')
      }
      .width('100%')
      .padding(16)
    }
    .height('100%')
  }
}


