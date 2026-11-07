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
struct SegmentButtonV22630 {
  @Local selectedIndexes: number[] = [0];
  @Local buttonItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '按钮1' },
    { text: '按钮2' },
    { text: '按钮3' },
    { text: '按钮4' }
  ]);
  @Local itemSelectedBackgroundColorInfo: string = '默认';
  @Local itemSelectedBackgroundColorValue: ColorMetrics | undefined = undefined;

  build() {
    Row() {
      Column() {
        Text('SegmentButtonV2 - itemSelectedBackgroundColor测试')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('MultiCapsuleSegmentButtonV2 胶囊型分段按钮（多选）')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ bottom: 20 })

        Text(`当前itemSelectedBackgroundColor：${this.itemSelectedBackgroundColorInfo}`)
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 20 })

        MultiCapsuleSegmentButtonV2({
          items: this.buttonItems,
          selectedIndexes: this.selectedIndexes!!,
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
            // 下拉选择器功能
          })

        Button('设置rgba黄色')
          .id('rgbaColorButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.itemSelectedBackgroundColorValue = ColorMetrics.rgba(1000, 1000, 0, 1000);
            this.itemSelectedBackgroundColorInfo = 'rgba(1000,1000,0,1000) - 黄色';
          })

        Button('重置')
          .id('resetButton')
          .width('80%')
          .height(40)
          .margin({ bottom: 20 })
          .onClick(() => {
            this.itemSelectedBackgroundColorValue = undefined;
            this.itemSelectedBackgroundColorInfo = '默认';
            this.selectedIndexes = [0];
          })

        Text('预期：已选择的分段按钮的背景颜色按照预设颜色正常显示，为黄色')
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


