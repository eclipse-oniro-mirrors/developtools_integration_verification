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
struct UiComponentButtonButtonRadius37 {
  @State text: string = 'SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0170';
  @State currentFontSizeScale: number = 1;

  // 设置字体大小
  async setFontScale(scale: number): Promise<void> {
    let configInit: Configuration = {
      fontSizeScale: scale,
    };
    // 更新配置-字体大小
    abilityManager.updateConfiguration(configInit, (err: BusinessError) => {
      if (err) {
        console.error(`updateConfiguration fail, err: ${JSON.stringify(err)}`);
      } else {
        this.currentFontSizeScale = scale;
        console.log('updateConfiguration success. Current scale: ' + scale);
      }
    });
  }

  build() {
    Scroll() {
      Column({ space: 5 }) {
        Text('Button适老化测试')
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
              .labelStyle({ overflow: TextOverflow.Clip,
                maxLines: 1,
                minFontSize: 10,
                maxFontSize: 20,
                font: {
                  size: 14,
                  weight: FontWeight.Bolder,
                  family: 'cursive',
                  style: FontStyle.Italic
                }
              })
              .id('UiComponentButtonButtonRadius37_01')
              .fontSize(12)
              .height(40)

            Button('1.75倍')
              .onClick(() => {
                this.setFontScale(1.75)
              })
              .labelStyle({ overflow: TextOverflow.Clip,
                maxLines: 1,
                minFontSize: 10,
                maxFontSize: 20,
                font: {
                  size: 14,
                  weight: FontWeight.Bolder,
                  family: 'cursive',
                  style: FontStyle.Italic
                }
              })
              .id('UiComponentButtonButtonRadius37_02')
              .fontSize(12)
              .height(40)

            Button('2倍')
              .onClick(() => {
                this.setFontScale(2)
              })
              .labelStyle({ overflow: TextOverflow.Clip,
                maxLines: 1,
                minFontSize: 10,
                maxFontSize: 20,
                font: {
                  size: 14,
                  weight: FontWeight.Bolder,
                  family: 'cursive',
                  style: FontStyle.Italic
                }
              })
              .id('UiComponentButtonButtonRadius37_03')
              .fontSize(12)
              .height(40)

            Button('3.2倍')
              .onClick(() => {
                this.setFontScale(3.2)
              })
              .labelStyle({ overflow: TextOverflow.Clip,
                maxLines: 1,
                minFontSize: 10,
                maxFontSize: 20,
                font: {
                  size: 14,
                  weight: FontWeight.Bolder,
                  family: 'cursive',
                  style: FontStyle.Italic
                }
              })
              .id('UiComponentButtonButtonRadius37_04')
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
          Text('Button默认样式测试')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Center)

          Button('默认按钮1')
            .id('ButtonRadius0170_05')
            .width('80%')
            .height(50)
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

          Text('✓ 开启适老化后')
            .fontSize(11)
            .fontColor('#333')
            .width('100%')
            .lineHeight(18)
            .textAlign(TextAlign.Start)
          Text('✓ 按钮默认样式为ROUNDED_RECTANGLE')
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

