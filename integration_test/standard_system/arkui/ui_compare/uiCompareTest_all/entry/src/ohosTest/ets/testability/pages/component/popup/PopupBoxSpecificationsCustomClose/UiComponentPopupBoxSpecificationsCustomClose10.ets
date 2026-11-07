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

import { BusinessError } from '@kit.BasicServicesKit';
import { PromptAction, promptAction } from '@kit.ArkUI';

@Entry
@ComponentV2
struct UIComponentPopupBoxSpecificationsCustomClose10 {
  @Local message: string = 'presentCustomDialog 测试';
  private ctx: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.ctx.getPromptAction();
  private dialogController: promptAction.DialogController = new promptAction.DialogController();
  @Local testResult: string = '等待测试';
  @Local clickCount: number = 0;

  private baseDialogOptions4: promptAction.DialogOptions = {
    maskRect: {
      x: 20,
      y: 20,
      width: 1150,
      height: 1150
    },
    alignment: DialogAlignment.Bottom,
    offset: { dx: 50, dy: 0 },
    showInSubWindow: false,
    isModal: true,
    autoCancel: false,
    maskColor: 'rgb(255.100.255)',
    keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
    enableHoverMode: true,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THIN
  }

  @Builder
  customDialogComponentWithId(dialogId: number) {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontColor('#333333')
        .margin({ bottom: 15 })

      Text(`弹窗ID: ${dialogId}`)
        .fontSize(16)
        .fontColor('#007DFF')
        .margin({ bottom: 10 })

      Text(`点击次数: ${this.clickCount}`)
        .fontSize(16)
        .fontColor('#666666')
        .margin({ bottom: 20 })

      Button('点我关闭弹窗：通过自定义组件自带的controller')
        .id('UIComponentPopupBoxSpecificationsCustomClose10_02')
        .fontSize(14)
        .width('90%')
        .height(45)
        .backgroundColor('#FF6B6B')
        .onClick(() => {
          console.log('通过自定义组件自带的 controller 关闭，dialogId: ' + dialogId);
          this.promptAction.closeCustomDialog(dialogId);
          this.testResult = '✓ 成功：通过组件自带的 controller (dialogId) 关闭弹窗';
        })
        .margin({ bottom: 10 })

      Button('点我关闭弹窗：通过外部传递的DialogController')
        .id('UIComponentPopupBoxSpecificationsCustomClose10_03')
        .fontSize(14)
        .width('90%')
        .height(45)
        .backgroundColor('#4CAF50')
        .onClick(() => {
          console.log('通过外部传递的 DialogController 关闭');
          this.dialogController.close();
          this.testResult = '✓ 成功：通过外部 DialogController 关闭弹窗';
        })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('测试弹窗的两种关闭方式：\n1. 通过自定义组件自带的 controller (dialogId)\n2. 通过外部传递的 DialogController')
          .fontSize(14)
          .lineHeight(22)
          .padding(15)
          .backgroundColor('#E3F2FD')
          .borderRadius(8)
          .width('90%')
          .textAlign(TextAlign.Center)

        Divider()
          .width('90%')
          .color('#E0E0E0')

        Column({ space: 15 }) {
          Text('测试按钮')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)

          Button('DO4')
            .id('UIComponentPopupBoxSpecificationsCustomClose10_01')
            .fontSize(18)
            .width('100%')
            .height(50)
            .labelStyle({ overflow: TextOverflow.Clip,
              maxLines: 1,
              minFontSize: 20,
              maxFontSize: 20,
              font: {
                size: 20,
                weight: FontWeight.Bolder,
                family: 'cursive',
                style: FontStyle.Italic
              }
            })
            .type(ButtonType.Capsule)
            .backgroundColor('#007DFF')
            .onClick(() => {
              this.clickCount++;
              console.log('点击 DO4 按钮');
              this.promptAction.presentCustomDialog((dialogId: number) => {
                this.customDialogComponentWithId(dialogId)
              }, this.dialogController, this.baseDialogOptions4)
                .then((dialogId: number) => {
                  console.log('presentCustomDialog 成功，dialogId: ' + dialogId);
                  this.testResult = `弹窗已打开，dialogId: ${dialogId}`;
                })
                .catch((err: BusinessError) => {
                  console.error('presentCustomDialog error: ' + err.code + ' ' + err.message);
                  this.testResult = `弹窗打开失败: ${err.message}`;
                })
            })

          Button('重置测试')
            .fontSize(16)
            .width('100%')
            .height(45)
            .backgroundColor('#FF9800')
            .onClick(() => {
              this.clickCount = 0;
              this.testResult = '等待测试';
            })
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)
        .shadow({ radius: 4, color: '#00000020' })

        Column({ space: 10 }) {
          Text('配置说明')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          Text('baseDialogOptions4:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)
            .margin({ top: 5 })

          Text('- maskRect: x:20, y:20, width:1150, height:1150\n' +
            '- alignment: DialogAlignment.Bottom\n' +
            '- offset: dx:50, dy:0\n' +
            '- showInSubWindow: false\n' +
            '- isModal: true\n' +
            '- autoCancel: false\n' +
            '- maskColor: rgb(255.100.255)\n' +
            '- keyboardAvoidMode: KeyboardAvoidMode.DEFAULT\n' +
            '- enableHoverMode: true\n' +
            '- backgroundBlurStyle: BlurStyle.BACKGROUND_THIN')
            .fontSize(12)
            .lineHeight(20)
            .padding(12)
            .backgroundColor('#E3F2FD')
            .borderRadius(6)
            .width('100%')
            .fontFamily('monospace')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)

        Column({ space: 10 }) {
          Text('预期效果')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)
          Text('1、由于maskRect设置为右下角的一大块灰色蒙层。dialog由底部中心向右偏移了50vp。dialog的背景呈现近距景深模糊。dialog正常弹出\n' +
            '2、正常关闭自定义弹窗\n' +
            '4、正常关闭自定义弹窗')
            .fontSize(13)
            .lineHeight(20)
            .padding(10)
            .backgroundColor('#FFF8DC')
            .borderRadius(6)
            .width('100%')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)
        .margin({ bottom: 40 })
      }
      .width('100%')
      .padding({ left: 20, right: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
