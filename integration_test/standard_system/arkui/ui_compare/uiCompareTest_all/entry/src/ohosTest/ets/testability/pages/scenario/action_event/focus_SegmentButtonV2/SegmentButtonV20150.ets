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

import { MultiCapsuleSegmentButtonV2, SegmentButtonV2Items, ColorMetrics } from '@kit.ArkUI';

@Entry
@ComponentV2
struct SegmentButtonV20150 {
  @Local selectedIndexes: number[] = [0];
  @Local buttonItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '按钮1' },
    { text: '按钮2' },
    { text: '按钮3' },
    { text: '按钮4' }
  ]);
  @Local itemselectedsymbolfontcolorInfo: string = '默认颜色';
  @Local itemselectedsymbolfontcolorValue: ColorMetrics | undefined = undefined;
  @Local itemselectedbackgroundcolorValue: ColorMetrics | undefined = undefined;

  build() {
    Row() {
      Column() {
        Text('SegmentButtonV2 - itemSelectedSymbolFontColor测试')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('MultiCapsuleSegmentButtonV2 胶囊型分段按钮（多选）')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ bottom: 20 })

        Text(`当前颜色：${this.itemselectedsymbolfontcolorInfo}`)
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 20 })

        MultiCapsuleSegmentButtonV2({
          items: this.buttonItems,
          selectedIndexes: this.selectedIndexes!!,
          itemSelectedSymbolFontColor: this.itemselectedsymbolfontcolorValue,
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

        Button('itemSelectedSymbolFontColor接口')
          .id('itemSelectedSymbolFontColorButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.itemselectedbackgroundcolorValue = ColorMetrics.resourceColor($r('app.color.Pink'));
            this.itemselectedsymbolfontcolorInfo = 'ColorMetrics.resourceColor($r(app.color.Pink)) - 粉色';
          })

        Button('重置')
          .id('resetButton')
          .width('80%')
          .height(40)
          .margin({ bottom: 20 })
          .onClick(() => {
            this.itemselectedsymbolfontcolorValue = undefined;
            this.itemselectedbackgroundcolorValue = undefined;
            this.itemselectedsymbolfontcolorInfo = '默认颜色';
            this.selectedIndexes = [0];
          })

        Text('预期：已选择的分段按钮的HM Symbol类型图标按照预设颜色正常显示，为粉色')
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
