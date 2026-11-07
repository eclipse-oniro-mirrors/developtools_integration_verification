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

import { abilityManager, Configuration } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UiComponentButtonButtonRadius36 {
  @State text: string = 'SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0160 BindPopup适老化';
  @State currentFontSizeScale: number = 1;
  @State handlePopup: boolean = false;
  @State popupClickCount: number = 0;

  async setFontScale(scale: number): Promise<void> {
    let configInit: Configuration = {
      fontSizeScale: scale,
    };
    abilityManager.updateConfiguration(configInit, (err: BusinessError) => {
      if (err) {
        console.error(`updateConfiguration fail, err: ${JSON.stringify(err)}`);
      } else {
        this.currentFontSizeScale = scale;
        console.log('updateConfiguration success.');
      }
    });
  }

  @Builder
  popupBuilder() {
    Column({ space: 10 }) {
      Text('弹窗内容')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor('#333')
        .width('100%')
        .textAlign(TextAlign.Center)

      Text('这是一个测试弹窗')
        .fontSize(12)
        .fontColor('#666')
        .width('100%')
        .textAlign(TextAlign.Center)
        .lineHeight(18)

      Button('确认')
        .id('UiComponentButtonButtonRadius36_05')
        .onClick(() => {
          this.handlePopup = false
          this.popupClickCount++
          console.info('Popup confirm clicked')
        })
        .width(100)
        .height(40)

      Button('取消')
        .onClick(() => {
          this.handlePopup = false
          console.info('Popup cancel clicked')
        })
        .width(100)
        .height(40)
    }
    .padding(15)
    .backgroundColor(Color.White)
  }

  build() {
    Scroll() {
      Column({ space: 5 }) {
        Text('BindPopup适老化测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
          .backgroundColor('#FF6B35')
          .width('90%')
          .padding(12)
          .borderRadius(8)
          .textAlign(TextAlign.Center)
          .margin({ top: 10 })

        Text('当前字体倍数: ' + this.currentFontSizeScale)
          .fontSize(12)
          .fontColor('#666')
          .width('90%')
          .margin({ top: 5 })
          .textAlign(TextAlign.Start)

        Text('弹窗确认次数: ' + this.popupClickCount)
          .fontSize(12)
          .fontColor('#2196F3')
          .width('90%')
          .margin({ top: 5 })
          .textAlign(TextAlign.Start)

        Column({ space: 10 }) {
          Text('字体缩放控制')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#2196F3')
            .width('100%')
            .textAlign(TextAlign.Center)

          Row({ space: 10 }) {
            Button('1倍')
              .onClick(() => {
                this.setFontScale(1)
              })
              .id('UiComponentButtonButtonRadius36_01')
              .fontSize(12)
              .height(40)

            Button('1.75倍')
              .onClick(() => {
                this.setFontScale(1.75)
              })
              .id('UiComponentButtonButtonRadius36_02')
              .fontSize(12)
              .height(40)

            Button('2倍')
              .onClick(() => {
                this.setFontScale(2)
              })
              .id('UiComponentButtonButtonRadius36_03')
              .fontSize(12)
              .height(40)

            Button('3.2倍')
              .onClick(() => {
                this.setFontScale(3.2)
              })
              .id('UiComponentButtonButtonRadius36_04')
              .fontSize(12)
              .height(40)
          }
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#E3F2FD')
        .borderRadius(5)
        .margin({ top: 10 })

        Column({ space: 10 }) {
          Text('BindPopup测试')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Center)

          Text('点击下方按钮显示弹窗')
            .fontSize(12)
            .fontColor('#666')
            .width('100%')
            .textAlign(TextAlign.Center)
            .lineHeight(18)

          Button('显示Popup')
            .onClick(() => {
              this.handlePopup = !this.handlePopup
            })
            .id('UiComponentButtonButtonRadius36_05')
            .width(200)
            .height(50)
            .bindPopup(this.handlePopup, {
              builder: this.popupBuilder,
              placement: Placement.Top,
              maskColor: 0x33000000,
              popupColor: Color.White,
              enableArrow: true,
              onStateChange: (e) => {
                console.info('Popup state change: ' + JSON.stringify(e))
              }
            })

          Text('弹窗状态: ' + (this.handlePopup ? '显示中' : '已关闭'))
            .fontSize(12)
            .fontColor(this.handlePopup ? '#4CAF50' : '#999')
            .margin({ top: 5 })
            .width('100%')
            .textAlign(TextAlign.Center)
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#E8F5E9')
        .borderRadius(5)
        .margin({ top: 10 })

        Column({ space: 5 }) {
          Text('预期结果')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#D32F2F')
            .width('100%')
            .textAlign(TextAlign.Start)

          Text('✓ 开启适老化后点击按钮')
            .fontSize(11)
            .fontColor('#333')
            .width('100%')
            .lineHeight(18)
            .textAlign(TextAlign.Start)
          Text('✓ 弹窗内按钮默认样式为ROUNDED_RECTANGLE')
            .fontSize(11)
            .fontColor('#333')
            .width('100%')
            .lineHeight(18)
            .textAlign(TextAlign.Start)
          Text('✓ 按钮圆角正常显示')
            .fontSize(11)
            .fontColor('#333')
            .width('100%')
            .lineHeight(18)
            .textAlign(TextAlign.Start)
          Text('✓ 弹窗内容清晰可见')
            .fontSize(11)
            .fontColor('#333')
            .width('100%')
            .lineHeight(18)
            .textAlign(TextAlign.Start)
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#FFEBEE')
        .borderRadius(5)
        .alignItems(HorizontalAlign.Start)
        .margin({ top: 10, bottom: 10 })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
