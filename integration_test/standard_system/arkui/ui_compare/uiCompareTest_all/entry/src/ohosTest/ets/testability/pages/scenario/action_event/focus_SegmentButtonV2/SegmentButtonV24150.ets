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

import { TabSegmentButtonV2, SegmentButtonV2Items , ColorMetrics } from '@kit.ArkUI';

@Entry
@ComponentV2
struct SegmentButtonV24150 {
  @Local selectedIndex: number = 0;
  @Local buttonItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '按钮1' },
    { text: '按钮2' },
    { text: '按钮3' },
    { text: '按钮4' }
  ]);
  @Local itemselectedfontcolorInfo: string = '默认颜色';
  @Local itemselectedfontcolorValue: ColorMetrics | undefined = undefined;

  build() {
    Row() {
      Column() {
        Text('SegmentButtonV2 - itemSelectedFontColor测试')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('TabSegmentButtonV2 页签型分段按钮')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ bottom: 20 })

        Text(`当前颜色：${this.itemselectedfontcolorInfo}`)
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 20 })

        TabSegmentButtonV2({
          items: this.buttonItems,
          selectedIndex: this.selectedIndex,
          itemSelectedFontColor: this.itemselectedfontcolorValue
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
            this.itemselectedfontcolorValue = ColorMetrics.rgba(1000, 1000, 0, 1000);
            this.itemselectedfontcolorInfo = 'rgba(1000,1000,0,1000) - 黄色';
          })

        Button('重置')
          .id('resetButton')
          .width('80%')
          .height(40)
          .margin({ bottom: 20 })
          .onClick(() => {
            this.itemselectedfontcolorValue = undefined;
            this.itemselectedfontcolorInfo = '默认';
            this.selectedIndex = 0;
          })

        Text('预期：已选择的分段按钮的字体颜色按照预设颜色正常显示，为黄色')
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
