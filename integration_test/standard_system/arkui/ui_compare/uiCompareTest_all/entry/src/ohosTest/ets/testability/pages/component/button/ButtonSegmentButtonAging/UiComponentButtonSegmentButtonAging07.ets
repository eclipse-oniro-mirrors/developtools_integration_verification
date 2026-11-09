/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { SegmentButton, SegmentButtonOptions, ItemRestriction, SegmentButtonTextItem } from '@kit.ArkUI';
import { abilityManager, Configuration } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UiComponentButtonSegmentButtonAging07 {
  @State testId: string = 'SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0180';
  @State currentFontSizeScale: number = 1;
  @State fontScaleText: string = '标准档 (1倍)';
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [{ text: '页签按钮1' }, { text: '页签按钮2' }, { text: '页签按钮3' }] as ItemRestriction<SegmentButtonTextItem>,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  });
  @State tabSelectedIndexes: number[] = [0];
  @State testResults: string[] = [];

  async setFontScale(scale: number, scaleName: string): Promise<void> {
    let configInit: Configuration = {
      fontSizeScale: scale,
    };

    abilityManager.updateConfiguration(configInit, (err: BusinessError) => {
      if (err) {
        console.error(`updateConfiguration fail, err: ${JSON.stringify(err)}`);
        this.testResults.push(`设置${scaleName}失败: ${err.message}`);
      } else {
        this.currentFontSizeScale = scale;
        this.fontScaleText = scaleName;
        console.log(`updateConfiguration success. Scale: ${scale}`);
        this.testResults.push(`已设置为${scaleName}`);
      }
    });
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Column({ space: 5 }) {
          SegmentButton({
            options: this.tabOptions,
            selectedIndexes: this.tabSelectedIndexes,
            maxFontScale: undefined
          })
            .width('90%')

          Text('当前字体档位:')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Center)

          Text(this.fontScaleText)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF6B35')
            .width('100%')
            .textAlign(TextAlign.Center)

          Text(`系统字体缩放倍数: ${this.currentFontSizeScale}`)
            .fontSize(14)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Center)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E8F5E9')
        .borderRadius(10)

        Column({ space: 10 }) {
          Text('字体档位控制:')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#2196F3')
            .width('100%')
            .textAlign(TextAlign.Start)

          Row({ space: 10 }) {
            Button('标准档')
              .onClick(() => {
                console.log('适老化1倍成功')
                this.setFontScale(1, '标准档 (1倍)')
              })
              .id('UiComponentButtonSegmentButtonAging07_01')
              .fontSize(14)
              .backgroundColor(this.currentFontSizeScale === 1 ? '#FF6B35' : '#E0E0E0')
              .fontColor(this.currentFontSizeScale === 1 ? Color.White : Color.Black)
              .layoutWeight(1)

            Button('大1档')
              .onClick(() => {
                console.log('适老化1.15倍成功')
                this.setFontScale(1.15, '大1档 (1.15倍)')
              })
              .id('UiComponentButtonSegmentButtonAging07_02')
              .fontSize(14)
              .backgroundColor(this.currentFontSizeScale === 1.15 ? '#FF6B35' : '#E0E0E0')
              .fontColor(this.currentFontSizeScale === 1.15 ? Color.White : Color.Black)
              .layoutWeight(1)
          }
          .width('100%')

          Row({ space: 10 }) {
            Button('大2档')
              .onClick(() => {
                console.log('适老化1.3倍成功')
                this.setFontScale(1.3, '大2档 (1.3倍)')
              })
              .id('UiComponentButtonSegmentButtonAging07_03')
              .fontSize(14)
              .backgroundColor(this.currentFontSizeScale === 1.3 ? '#FF6B35' : '#E0E0E0')
              .fontColor(this.currentFontSizeScale === 1.3 ? Color.White : Color.Black)
              .layoutWeight(1)

            Button('大3档')
              .onClick(() => {
                console.log('适老化1.45倍成功')
                this.setFontScale(1.45, '大3档 (1.45倍)')
              })
              .id('UiComponentButtonSegmentButtonAging07_04')
              .fontSize(14)
              .backgroundColor(this.currentFontSizeScale === 1.45 ? '#FF6B35' : '#E0E0E0')
              .fontColor(this.currentFontSizeScale === 1.45 ? Color.White : Color.Black)
              .layoutWeight(1)
          }
          .width('100%')

          Row({ space: 10 }) {
            Button('大4档')
              .onClick(() => {
                console.log('适老化1.75倍成功')
                this.setFontScale(1.75, '大4档 (1.75倍)')
              })
              .id('UiComponentButtonSegmentButtonAging07_05')
              .fontSize(14)
              .backgroundColor(this.currentFontSizeScale === 1.75 ? '#FF6B35' : '#E0E0E0')
              .fontColor(this.currentFontSizeScale === 1.75 ? Color.White : Color.Black)
              .layoutWeight(1)

            Button('大5档')
              .onClick(() => {
                console.log('适老化2倍成功')
                this.setFontScale(2, '大5档 (2倍)')
              })
              .id('UiComponentButtonSegmentButtonAging07_06')
              .fontSize(14)
              .backgroundColor(this.currentFontSizeScale === 2 ? '#FF6B35' : '#E0E0E0')
              .fontColor(this.currentFontSizeScale === 2 ? Color.White : Color.Black)
              .layoutWeight(1)
          }
          .width('100%')

          Button('大6档 (3.2倍)')
            .onClick(() => {
              console.log('适老化3.2倍成功')
              this.setFontScale(3.2, '大6档 (3.2倍)')
            })
            .id('UiComponentButtonSegmentButtonAging07_07')
            .fontSize(14)
            .backgroundColor(this.currentFontSizeScale === 3.2 ? '#FF6B35' : '#E0E0E0')
            .fontColor(this.currentFontSizeScale === 3.2 ? Color.White : Color.Black)
            .width('100%')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E3F2FD')
        .borderRadius(10)

        Column({ space: 8 }) {
          Text('测试预期:')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF5722')
            .width('100%')
            .textAlign(TextAlign.Center)

          Text('所有档位: 字体大小均为默认大小，字体粗细均为默认粗细')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)

          Divider()
            .margin({ top: 5, bottom: 5 })

          Text('注意: maxFontScale设置为undefined时，组件字体不跟随系统放大。')
            .fontSize(12)
            .fontColor('#FF5722')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontWeight(FontWeight.Bold)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFF3E0')
        .borderRadius(10)
      }
      .width('100%')
      .padding({ bottom: 30 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
