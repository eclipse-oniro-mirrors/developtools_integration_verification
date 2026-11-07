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
struct SegmentButtonV23340 {
  @Local selectedIndex: number = 0;
  @Local buttonItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '按钮1' },
    { text: '按钮2' },
    { text: '按钮3' },
    { text: '按钮4' }
  ]);
  @Local backgroundEffectInfo: string = '默认';
  @Local backgroundEffectValue: ESObject | undefined = undefined;

  build() {
    Row() {
      Column() {
        Text('SegmentButtonV2 - buttonBackgroundEffect测试')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('TabSegmentButtonV2 页签型分段按钮')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ bottom: 20 })

        Text(`当前buttonBackgroundEffect：${this.backgroundEffectInfo}`)
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 20 })

        TabSegmentButtonV2({
          items: this.buttonItems,
          selectedIndex: this.selectedIndex,
          buttonBackgroundEffect: this.backgroundEffectValue
        })
          .id('segmentButton')
          .width('100%')
          .margin({ bottom: 30 })

        Text('参数配置')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        Button('buttonBackgroundEffect接口')
          .id('buttonBackgroundEffectButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            // 接口已启用
          })

        Button('设置正常值')
          .id('normalButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.backgroundEffectValue = {
              radius: 99,
              saturation: 2,
              brightness: 2,
              color: ColorMetrics.rgba(1000, 0, 500, 1000) // 粉色
            } as ESObject;
            this.backgroundEffectInfo = 'radius=99, saturation=2, brightness=2, color=粉色';
          })

        Button('重置')
          .id('resetButton')
          .width('80%')
          .height(40)
          .margin({ bottom: 20 })
          .onClick(() => {
            this.backgroundEffectValue = undefined;
            this.backgroundEffectInfo = '默认';
            this.selectedIndex = 0;
          })

        Text('预期：分段按钮背景按照预设背景效果正常显示，能够正常显示预设的粉色效果')
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
