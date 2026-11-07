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

import { promptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct JichuSr000Hub4K0010 {
  @State toastMessage: string = 'Hello World'
  @State toastDuration: number = 2000
  @State toastBottom: number = 180
  @State selectedAlignment: number = 0
  @State enableHover: boolean = true
  @State lastToastTime: string = ''

  private alignmentOptions: string[] = ['Top', 'Center', 'Bottom', 'TopStart', 'TopEnd', 'BottomStart', 'BottomEnd']
  private alignmentValues: Alignment[] = [
    Alignment.Top,
    Alignment.Center,
    Alignment.Bottom,
    Alignment.TopStart,
    Alignment.TopEnd,
    Alignment.BottomStart,
    Alignment.BottomEnd
  ]

  showToast() {
    try {
      promptAction.showToast({
        message: this.toastMessage,
        duration: this.toastDuration,
        bottom: this.toastBottom,
        showMode: 1,
        alignment: this.alignmentValues[this.selectedAlignment],
        offset: { dx: 10, dy: 10 },
        backgroundColor: Color.Pink,
        textColor: Color.Blue,
        shadow: {
          radius: 10,
          type: ShadowType.BLUR,
          color: Color.Green,
          offsetX: 10,
          offsetY: 10,
          fill: true
        },
        enableHoverMode: this.enableHover,
        hoverModeArea: HoverModeAreaType.TOP_SCREEN
      });
      this.lastToastTime = new Date().toLocaleTimeString()
    } catch (error) {
      let message = (error as BusinessError).message;
      let code = (error as BusinessError).code;
      console.error(`showToast args error code is ${code}, message is ${message}`);
    }
  }

  build() {
    Column() {
      // 标题区域
      Column() {
        Text('Toast 测试页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
        Text('JichuSr000Hub4K0010')
          .fontSize(12)
          .fontColor('#CCCCCC')
          .margin({ top: 4 })
      }
      .width('100%')
      .padding({ top: 40, bottom: 20 })
      .backgroundColor('#4A90D9')

      // 内容区域
      Scroll() {
        Column() {
          // 消息设置标题
          Text('消息设置')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')
            .width('100%')
            .margin({ top: 16, bottom: 8 })

          // 消息内容
          Row() {
            Text('消息内容')
              .fontSize(14)
              .fontColor('#666666')
              .width('35%')
            TextInput({ text: this.toastMessage })
              .width('65%')
              .height(36)
              .fontSize(14)
              .onChange((value: string) => {
                this.toastMessage = value
              })
          }
          .width('100%')
          .height('3.93%')
          .padding({ left: 12, right: 12 })
          .backgroundColor('#FFFFFF')
          .borderRadius(8)
          .margin({ bottom: 8 })

          // 显示时长
          Row() {
            Text('显示时长(ms)')
              .fontSize(14)
              .fontColor('#666666')
              .width('35%')
            TextInput({ text: this.toastDuration.toString() })
              .width('65%')
              .height(36)
              .fontSize(14)
              .type(InputType.Number)
              .onChange((value: string) => {
                this.toastDuration = parseInt(value) || 2000
              })
          }
          .width('100%')
          .height('3.93%')
          .padding({ left: 12, right: 12 })
          .backgroundColor('#FFFFFF')
          .borderRadius(8)
          .margin({ bottom: 8 })

          // 底部距离
          Row() {
            Text('底部距离')
              .fontSize(14)
              .fontColor('#666666')
              .width('30%')
            Slider({
              value: this.toastBottom,
              min: 0,
              max: 500,
              step: 10
            })
              .width('55%')
              .onChange((value: number) => {
                this.toastBottom = value
              })
            Text(this.toastBottom.toFixed(0))
              .fontSize(12)
              .width('15%')
              .textAlign(TextAlign.End)
          }
          .width('100%')
          .height('3.93%')
          .padding({ left: 12, right: 12 })
          .backgroundColor('#FFFFFF')
          .borderRadius(8)
          .margin({ bottom: 8 })

          // 对齐方式标题
          Text('对齐方式')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')
            .width('100%')
            .margin({ top: 16, bottom: 8 })

          // 对齐方式选择
          Grid() {
            ForEach(this.alignmentOptions, (item: string, index: number) => {
              GridItem() {
                Text(item)
                  .fontSize(12)
                  .fontColor(this.selectedAlignment === index ? '#FFFFFF' : '#333333')
                  .textAlign(TextAlign.Center)
                  .width('100%')
                  .height(36)
                  .backgroundColor(this.selectedAlignment === index ? '#4A90D9' : '#F5F5F5')
                  .borderRadius(18)
                  .onClick(() => {
                    this.selectedAlignment = index
                  })
              }
            })
          }
          .columnsTemplate('1fr 1fr 1fr')
          .rowsGap(8)
          .columnsGap(8)
          .width('100%')
          .height('7.38%')

          // 悬浮模式标题
          Text('悬浮模式')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')
            .width('100%')
            .margin({ top: 16, bottom: 8 })

          // 悬浮模式开关
          Row() {
            Text('启用悬浮模式')
              .fontSize(14)
              .fontColor('#666666')
              .layoutWeight(1)
            Toggle({ type: ToggleType.Switch, isOn: this.enableHover })
              .onChange((isOn: boolean) => {
                this.enableHover = isOn
              })
          }
          .width('100%')
          .height('3.93%')
          .padding({ left: 12, right: 12 })
          .backgroundColor('#FFFFFF')
          .borderRadius(8)
          .margin({ bottom: 8 })

          // 样式预览标题
          Text('样式预览')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')
            .width('100%')
            .margin({ top: 16, bottom: 8 })

          // 样式预览区域
          Column() {
            Row() {
              Text(this.toastMessage)
                .fontSize(14)
                .fontColor(Color.Blue)
                .padding({ left: 16, right: 16, top: 10, bottom: 10 })
            }
            .backgroundColor(Color.Pink)
            .borderRadius(20)
            .shadow({
              radius: 10,
              type: ShadowType.BLUR,
              color: Color.Green,
              offsetX: 10,
              offsetY: 10
            })
          }
          .width('100%')
          .height('6.56%')
          .justifyContent(FlexAlign.Center)
          .backgroundColor('#F9F9F9')
          .borderRadius(8)
          .margin({ bottom: 16 })

          // 上次触发时间
          Text(this.lastToastTime !== '' ? `上次触发时间: ${this.lastToastTime}` : '')
            .fontSize(12)
            .fontColor('#999999')
            .margin({ bottom: 16 })
            .visibility(this.lastToastTime !== '' ? Visibility.Visible : Visibility.None)

          // 触发按钮
          Button('显示 Toast')
            .id('show_toast_btn_0010')
            .width('100%')
            .height(50)
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .backgroundColor('#4A90D9')
            .borderRadius(25)
            .onClick(() => {
              this.showToast()
            })
            .margin({ bottom: 20 })
        }
        .width('100%')
        .padding({ left: 16, right: 16, bottom: 20 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .backgroundColor('#F0F2F5')
    }
    .width('100%')
    .height('100%')
  }
}
