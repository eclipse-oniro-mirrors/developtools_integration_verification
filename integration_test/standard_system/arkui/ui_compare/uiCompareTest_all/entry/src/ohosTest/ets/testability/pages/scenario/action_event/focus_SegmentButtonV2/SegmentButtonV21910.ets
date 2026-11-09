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

import { MultiCapsuleSegmentButtonV2, SegmentButtonV2Items } from '@kit.ArkUI';

@Entry
@ComponentV2
struct SegmentButtonV21910 {
  @Local selectedIndexes: number[] = [0];
  @Local buttonItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '按钮1' },
    { text: '按钮2' },
    { text: '按钮3' },
    { text: '按钮4' }
  ]);
  @Local blurStyleInfo: string = '默认';
  @Local blurStyle: BlurStyle | undefined = undefined;

  build() {
    Row() {
      Column() {
        Text('SegmentButtonV2 - buttonBackgroundBlurStyle测试')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('MultiCapsuleSegmentButtonV2 胶囊型分段按钮（多选）')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ bottom: 20 })

        Text(`当前buttonBackgroundBlurStyle：${this.blurStyleInfo}`)
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 20 })

        MultiCapsuleSegmentButtonV2({
          items: this.buttonItems,
          selectedIndexes: this.selectedIndexes!!
        })
          .id('segmentButton')
          .width('100%')
          .margin({ bottom: 30 })

        Text('参数配置')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        Button('设置BlurStyle为COMPONENT_THICK')
          .id('componentThickButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.blurStyle = BlurStyle.COMPONENT_THICK;
            this.blurStyleInfo = 'BlurStyle.COMPONENT_THICK';
          })

        Button('重置')
          .id('resetButton')
          .width('80%')
          .height(40)
          .margin({ bottom: 20 })
          .onClick(() => {
            this.blurStyle = undefined;
            this.blurStyleInfo = '默认';
            this.selectedIndexes = [0];
          })

        Text('预期：分段按钮背景按照预设模糊 COMPONENT_THICK 正常显示')
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


