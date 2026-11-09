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
struct UiComponentButtonButtonRadius39 {
  @State text: string = 'SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0210 TimePickerDialog适老化';
  @State currentFontSizeScale: number = 1;
  private selectedTime: Date = new Date('2024-01-01 08:00:00');
  @State dialogOpenCount: number = 0;
  @State lastSelectedTime: string = '未选择';

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
        Text('TimePickerDialog适老化测试')
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

        Text('弹窗打开次数: ' + this.dialogOpenCount)
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
              .id('UiComponentButtonButtonRadius39_01')
              .fontSize(12)
              .height(40)

            Button('1.75倍')
              .onClick(() => {
                this.setFontScale(1.75)
              })
              .id('UiComponentButtonButtonRadius39_02')
              .fontSize(12)
              .height(40)

            Button('2倍')
              .onClick(() => {
                this.setFontScale(2)
              })
              .id('UiComponentButtonButtonRadius39_03')
              .fontSize(12)
              .height(40)

            Button('3.2倍')
              .onClick(() => {
                this.setFontScale(3.2)
              })
              .id('UiComponentButtonButtonRadius39_04')
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
          Text('点击下方按钮打开时间选择器')
            .fontSize(12)
            .fontColor('#666')
            .width('100%')
            .textAlign(TextAlign.Center)
            .lineHeight(18)

          Button('显示TimePicker')
            .onClick(() => {
              this.dialogOpenCount++
              this.getUIContext().showTimePickerDialog({
                selected: this.selectedTime,
                acceptButtonStyle: {
                  role: ButtonRole.NORMAL,
                },
                cancelButtonStyle: {
                  role: ButtonRole.NORMAL,
                },
                onAccept: (value: TimePickerResult) => {
                  this.lastSelectedTime = JSON.stringify(value)
                  console.info('TimePickerDialog: onAccept() ' + JSON.stringify(value))
                },
                onCancel: () => {
                  console.info('TimePickerDialog: onCancel()')
                },
                onChange: (value: TimePickerResult) => {
                  console.info('TimePickerDialog: onChange() ' + JSON.stringify(value))
                }
              })
            })
            .id('UiComponentButtonButtonRadius39_05')
            .width(200)
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

          Text('✓ 开启适老化后点击按钮')
            .fontSize(11)
            .fontColor('#333')
            .width('100%')
            .lineHeight(18)
            .textAlign(TextAlign.Start)
          Text('✓ 由于设置默认高度，按钮高度不变')
            .fontSize(11)
            .fontColor('#333')
            .width('100%')
            .lineHeight(18)
            .textAlign(TextAlign.Start)
          Text('✓ 按钮样式仍呈现胶囊型')
            .fontSize(11)
            .fontColor('#333')
            .width('100%')
            .lineHeight(18)
            .textAlign(TextAlign.Start)
          Text('✓ 时间选择器功能正常')
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
