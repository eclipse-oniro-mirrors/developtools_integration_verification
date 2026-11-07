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
struct UiComponentButtonButtonRadius35 {
  @State text: string = 'SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0530 Toggle适老化';
  @State currentFontSizeScale: number = 1;
  @State isOn: boolean = true;

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

  build() {
    Scroll() {
      Column({ space: 5 }) {
        Text('Toggle Button适老化测试')
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
              .labelStyle({ overflow: TextOverflow.Clip,
                maxLines: 2,
                minFontSize: 10,
                maxFontSize: 20,
                font: {
                  size: 20,
                  weight: FontWeight.Bolder,
                  family: 'cursive',
                  style: FontStyle.Italic
                }
              })
              .onClick(() => {
                this.setFontScale(1)
              })
              .id('UiComponentButtonButtonRadius35_01')
              .fontSize(12)
              .height(40)

            Button('1.75倍')
              .labelStyle({ overflow: TextOverflow.Clip,
                maxLines: 2,
                minFontSize: 10,
                maxFontSize: 20,
                font: {
                  size: 20,
                  weight: FontWeight.Bolder,
                  family: 'cursive',
                  style: FontStyle.Italic
                }
              })
              .onClick(() => {
                this.setFontScale(1.75)
              })
              .id('UiComponentButtonButtonRadius35_02')
              .fontSize(12)
              .height(40)

            Button('2倍')
              .labelStyle({ overflow: TextOverflow.Clip,
                maxLines: 2,
                minFontSize: 10,
                maxFontSize: 20,
                font: {
                  size: 20,
                  weight: FontWeight.Bolder,
                  family: 'cursive',
                  style: FontStyle.Italic
                }
              })
              .onClick(() => {
                this.setFontScale(2)
              })
              .id('UiComponentButtonButtonRadius35_03')
              .fontSize(12)
              .height(40)

            Button('3.2倍')
              .labelStyle({ overflow: TextOverflow.Clip,
                maxLines: 2,
                minFontSize: 10,
                maxFontSize: 20,
                font: {
                  size: 20,
                  weight: FontWeight.Bolder,
                  family: 'cursive',
                  style: FontStyle.Italic
                }
              })
              .onClick(() => {
                this.setFontScale(3.2)
              })
              .id('UiComponentButtonButtonRadius35_04')
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
          Text('Toggle Button测试')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Center)

          Toggle({ type: ToggleType.Button, isOn: this.isOn }) {
            Text('Toggle Button')
              .fontSize(14)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Medium)
          }
          .id('UiComponentButtonButtonRadius35_05')
          .selectedColor('#007DFF')
          .width(200)
          .height(60)
          .onChange((isOn: boolean) => {
            this.isOn = isOn
            console.info('Toggle Button status: ' + isOn)
          })

          Text('Toggle状态: ' + (this.isOn ? '开启' : '关闭'))
            .fontSize(12)
            .fontColor(this.isOn ? '#4CAF50' : '#999')
            .margin({ top: 5 })
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

          Text('✓ 非适老化场景：按钮呈现胶囊型')
            .fontSize(11)
            .fontColor('#333')
            .width('100%')
            .lineHeight(18)
            .textAlign(TextAlign.Start)
          Text('✓ 适老化后：按钮呈现圆角矩形')
            .fontSize(11)
            .fontColor('#333')
            .width('100%')
            .lineHeight(18)
            .textAlign(TextAlign.Start)
          Text('✓ 样式变化正常')
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

