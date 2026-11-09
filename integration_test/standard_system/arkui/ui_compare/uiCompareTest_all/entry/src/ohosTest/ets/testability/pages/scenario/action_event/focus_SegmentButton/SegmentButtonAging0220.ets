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

import { SegmentButton, SegmentButtonOptions } from '@kit.ArkUI';
import { abilityManager, Configuration } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct SegmentButtonAging0220 {
  @State multiplySelectCapsuleSelectedIndexes: number[] = [];
  @State currentFontSizeScale: number = 1;

  // 设置字体大小
  async setFontScale(scale: number): Promise<void> {
    let configInit: Configuration = {
      language: 'zh-Ch',
      fontSizeScale: scale,
    };
    // 更新配置-字体大小
    abilityManager.updateConfiguration(configInit, (err: BusinessError) => {
      if (err) {
        console.error(`updateConfiguration fail, err: ${JSON.stringify(err)}`);
      } else {
        this.currentFontSizeScale = scale;
        console.log(`updateConfiguration success. fontSizeScale: ${scale}`);
      }
    });
  }

  build() {
    Row() {
      Column() {
        Text('多选类分段按钮 - 适老化测试')
          .fontSize(20)
          .margin({ bottom: 10 })

        Text(`当前字体缩放倍数：${this.currentFontSizeScale}`)
          .fontSize(16)
          .fontColor('#0066CC')
          .margin({ bottom: 20 })

        SegmentButton({
          options: SegmentButtonOptions.capsule({
            buttons: [
              { text: '按钮1' },
              { text: '按钮2' },
              { text: '按钮3' },
              { text: '按钮4' }
            ],
            multiply: true
          }),
          selectedIndexes: this.multiplySelectCapsuleSelectedIndexes,
          maxFontScale: 0.5
        })
          .id('segmentButtonAging0220')
          .width('100%')

        Text('适老化档位切换：')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 10 })
          .width('100%')

        // 标准档
        Button('标准档 (1倍)')
          .width('100%')
          .margin({ bottom: 10 })
          .id('fontScale_1')
          .onClick(() => {
            this.setFontScale(1);
          })

        // 大1档
        Button('大1档 (1.15倍)')
          .width('100%')
          .margin({ bottom: 10 })
          .id('fontScale_1_15')
          .onClick(() => {
            this.setFontScale(1.15);
          })

        // 大2档
        Button('大2档 (1.3倍)')
          .width('100%')
          .margin({ bottom: 10 })
          .id('fontScale_1_3')
          .onClick(() => {
            this.setFontScale(1.3);
          })

        // 大3档
        Button('大3档 (1.45倍)')
          .width('100%')
          .margin({ bottom: 10 })
          .id('fontScale_1_45')
          .onClick(() => {
            this.setFontScale(1.45);
          })

        // 大4档
        Button('大4档 (1.75倍)')
          .width('100%')
          .margin({ bottom: 10 })
          .id('fontScale_1_75')
          .onClick(() => {
            this.setFontScale(1.75);
          })

        // 大5档
        Button('大5档 (2倍)')
          .width('100%')
          .margin({ bottom: 10 })
          .id('fontScale_2')
          .onClick(() => {
            this.setFontScale(2);
          })

        // 大6档
        Button('大6档 (2.5倍)')
          .width('100%')
          .margin({ bottom: 10 })
          .id('fontScale_2_5')
          .onClick(() => {
            this.setFontScale(2.5);
          })

        Text('注：maxFontScale=0.5（小于1按1处理），所有档位字体均为默认大小')
          .fontSize(12)
          .fontColor('#FF6600')
          .margin({ top: 10 })
          .width('100%')
      }
      .width('100%')
      .padding(16)
    }
    .height('100%')
  }
}






