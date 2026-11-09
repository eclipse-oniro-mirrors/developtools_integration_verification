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

import { CapsuleSegmentButtonV2, SegmentButtonV2Items, ColorMetrics } from '@kit.ArkUI';

@Entry
@ComponentV2
struct SegmentButtonV20010 {
  @Local selectedIndex: number = 0;
  @Local buttonItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '按钮1' },
    { text: '按钮2' },
    { text: '按钮3' },
    { text: '按钮4' }
  ]);
  @Local itemselectedbackgroundcolorInfo: string = '默认颜色';
  @Local itemselectedbackgroundcolorValue: ColorMetrics | undefined = undefined;

  build() {
    Row() {
      Column() {
        Text('SegmentButtonV2 - buttonBackgroundColor测试')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('CapsuleSegmentButtonV2 胶囊型分段按钮（单选）')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ bottom: 20 })

        Text(`当前颜色：${this.itemselectedbackgroundcolorInfo}`)
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 20 })

        CapsuleSegmentButtonV2({
          items: this.buttonItems,
          selectedIndex: this.selectedIndex,
          itemSelectedBackgroundColor: this.itemselectedbackgroundcolorValue
        })
          .id('segmentButton')
          .width('100%')
          .margin({ bottom: 30 })

        Text('参数配置')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        Button('buttonBackgroundColor接口')
          .id('buttonBackgroundColorButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.itemselectedbackgroundcolorValue = ColorMetrics.resourceColor($r('app.color.Pink'));
            this.itemselectedbackgroundcolorInfo = 'ColorMetrics.resourceColor($r(app.color.Pink)) - 粉色';
          })

        Button('重置')
          .id('resetButton')
          .width('80%')
          .height(40)
          .margin({ bottom: 20 })
          .onClick(() => {
            this.itemselectedbackgroundcolorValue = undefined;
            this.itemselectedbackgroundcolorInfo = '默认颜色';
            this.selectedIndex = 0;
          })

        Text('预期：分段按钮背景按照预设颜色正常显示，为粉色')
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
