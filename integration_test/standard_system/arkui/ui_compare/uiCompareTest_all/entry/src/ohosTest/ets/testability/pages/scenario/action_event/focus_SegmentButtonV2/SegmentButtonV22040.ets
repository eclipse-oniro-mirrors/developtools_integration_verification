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

import { MultiCapsuleSegmentButtonV2, SegmentButtonV2Items , ColorMetrics } from '@kit.ArkUI';

@Entry
@ComponentV2
struct SegmentButtonV22040 {
  @Local selectedIndexes: number[] = [0];
  @Local buttonItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '按钮1' },
    { text: '按钮2' },
    { text: '按钮3' },
    { text: '按钮4' }
  ]);
  @Local itemBackgroundColorInfo: string = '默认';
  @Local itemBackgroundColorValue: ColorMetrics | undefined = undefined;

  build() {
    Row() {
      Column() {
        Text('SegmentButtonV2 - itemBackgroundColor测试')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('MultiCapsuleSegmentButtonV2 胶囊型分段按钮（多选）')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ bottom: 20 })

        Text(`当前颜色：${this.itemBackgroundColorInfo}`)
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 20 })

        MultiCapsuleSegmentButtonV2({
          items: this.buttonItems,
          selectedIndexes: this.selectedIndexes!!,
          itemSelectedBackgroundColor: this.itemBackgroundColorValue
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
            // 下拉选择器功能
          })

        Button('红色')
          .id('redColorButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.itemBackgroundColorValue = ColorMetrics.rgba(1000, 0, 0, 1000);
            this.itemBackgroundColorInfo = '红色 - rgba(1000,0,0,1000)';
          })

        Button('绿色')
          .id('greenColorButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.itemBackgroundColorValue = ColorMetrics.rgba(0, 1000, 0, 1000);
            this.itemBackgroundColorInfo = '绿色 - rgba(0,1000,0,1000)';
          })

        Button('蓝色')
          .id('blueColorButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.itemBackgroundColorValue = ColorMetrics.rgba(0, 0, 1000, 1000);
            this.itemBackgroundColorInfo = '蓝色 - rgba(0,0,1000,1000)';
          })

        Button('黄色')
          .id('yellowColorButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.itemBackgroundColorValue = ColorMetrics.rgba(1000, 1000, 0, 1000);
            this.itemBackgroundColorInfo = '黄色 - rgba(1000,1000,0,1000)';
          })

        Button('青色')
          .id('cyanColorButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.itemBackgroundColorValue = ColorMetrics.rgba(0, 1000, 1000, 1000);
            this.itemBackgroundColorInfo = '青色 - rgba(0,1000,1000,1000)';
          })

        Button('品红色')
          .id('magentaColorButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.itemBackgroundColorValue = ColorMetrics.rgba(1000, 0, 1000, 1000);
            this.itemBackgroundColorInfo = '品红色 - rgba(1000,0,1000,1000)';
          })

        Button('白色')
          .id('whiteColorButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.itemBackgroundColorValue = ColorMetrics.rgba(1000, 1000, 1000, 1000);
            this.itemBackgroundColorInfo = '白色 - rgba(1000,1000,1000,1000)';
          })

        Button('半透明红色')
          .id('semiTransparentRedButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.itemBackgroundColorValue = ColorMetrics.rgba(1000, 0, 0, 500);
            this.itemBackgroundColorInfo = '半透明红色 - rgba(1000,0,0,500)';
          })

        Button('重置')
          .id('resetButton')
          .width('80%')
          .height(40)
          .margin({ bottom: 20 })
          .onClick(() => {
            this.itemBackgroundColorValue = undefined;
            this.itemBackgroundColorInfo = '默认';
            this.selectedIndexes = [0];
          })

        Text('预期：分段按钮背景按照预设颜色正常显示，透明度调节功能正常')
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


