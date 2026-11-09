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

import { TabSegmentButtonV2, SegmentButtonV2Items } from '@kit.ArkUI';

@Entry
@ComponentV2
struct SegmentButtonV23270 {
  @Local selectedIndex: number = 0;
  @Local buttonItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '按钮1' },
    { text: '按钮2' },
    { text: '按钮3' },
    { text: '按钮4' }
  ]);
  @Local blurStyleInfo: string = '默认';
  @Local blurStyle: BlurStyle | undefined = undefined;
  @Local showDropdown: boolean = true;

  build() {
    Row() {
      Column() {
        Text('SegmentButtonV2 - BackgroundBlurStyle测试')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('TabSegmentButtonV2 页签型分段按钮')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ bottom: 20 })

        Text(`当前buttonBackgroundBlurStyle：${this.blurStyleInfo}`)
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 20 })

        TabSegmentButtonV2({
          items: this.buttonItems,
          selectedIndex: this.selectedIndex,
          buttonBackgroundBlurStyle: this.blurStyle
        })
          .id('segmentButton')
          .width('100%')
          .margin({ bottom: 30 })

        Text('参数配置')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        Button('buttonbackgroundStyle接口')
          .id('buttonbackgroundStyleButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.showDropdown = !this.showDropdown;
          })

        Column() {
          Button('Regular')
            .id('regularButton')
            .width('90%')
            .height(40)
            .margin({ bottom: 5 })
            .onClick(() => {
              this.blurStyle = BlurStyle.Regular;
              this.blurStyleInfo = 'BlurStyle.Regular';
            })
        }
        .width('100%')
        .margin({ bottom: 10 })
        .visibility(this.showDropdown ? Visibility.Visible : Visibility.Hidden)

        Button('重置')
          .id('resetButton')
          .width('80%')
          .height(40)
          .margin({ bottom: 20 })
          .onClick(() => {
            this.blurStyle = undefined;
            this.blurStyleInfo = '默认';
            this.showDropdown = true;
            this.selectedIndex = 0;
          })

        Text('预期：分段按钮背景按照预设模糊Regular正常显示')
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


