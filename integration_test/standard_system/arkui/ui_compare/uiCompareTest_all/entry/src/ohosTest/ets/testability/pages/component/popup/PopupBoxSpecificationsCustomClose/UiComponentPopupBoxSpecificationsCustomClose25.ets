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
struct UIComponentPopupBoxSpecificationsCustomClose25 {
  @Local message: string = 'presentCustomDialog 测试';
  private ctx: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.ctx.getPromptAction();
  private dialogController: promptAction.DialogController = new promptAction.DialogController();
  @Local testResult: string = '等待测试';
  @Local clickCount: number = 0;
  @Local currentDialogId: number = 0;

  private baseDialogOptions6: promptAction.DialogOptions = {
    alignment: DialogAlignment.TopStart,
    showInSubWindow: false,
    isModal: true,
    autoCancel: false,
    maskColor: Color.Yellow,
    keyboardAvoidMode: KeyboardAvoidMode.NONE,
    enableHoverMode: true,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  }

  @Builder
  customDialogComponent() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontColor('#333333')
        .margin({ bottom: 15 })

      Text(`弹窗ID: ${this.currentDialogId}`)
        .fontSize(16)
        .fontColor('#007DFF')
        .margin({ bottom: 10 })

      Text(`点击次数: ${this.clickCount}`)
        .fontSize(16)
        .fontColor('#666666')
        .margin({ bottom: 20 })

      Button('点我关闭弹窗：通过自定义组件自带的controller')
        .id('UIComponentPopupBoxSpecificationsCustomClose25_02')
        .fontSize(14)
        .width('90%')
        .height(45)
        .backgroundColor('#FF6B6B')
        .onClick(() => {
          console.log('通过自定义组件自带的 controller 关闭，dialogId: ' + this.currentDialogId);
          this.promptAction.closeCustomDialog(this.currentDialogId);
          this.testResult = '✓ 成功：通过组件自带的 controller (dialogId) 关闭弹窗';
        })
        .margin({ bottom: 10 })

      Button('点我关闭弹窗：通过外部传递的DialogController')
        .id('UIComponentPopupBoxSpecificationsCustomClose25_03')
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

          Button('DO6')
            .id('UIComponentPopupBoxSpecificationsCustomClose25_01')
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
              console.log('点击 DO6 按钮');
              this.promptAction.presentCustomDialog(() => {
                this.customDialogComponent()
              }, this.dialogController, this.baseDialogOptions6)
                .then((dialogId: number) => {
                  console.log('presentCustomDialog 成功，dialogId: ' + dialogId);
                  this.currentDialogId = dialogId;
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

          Text('presentCustomDialog+CustomBuilder全部参数' +
            '- alignment: DialogAlignment.TopStart' +
            '- showInSubWindow: false' +
            '- isModal: true' +
            '- autoCancel: false' +
            '- maskColor: Color.Yellow' +
            '- keyboardAvoidMode: KeyboardAvoidMode.NONE' +
            '- enableHoverMode: true' +
            '- backgroundBlurStyle: BlurStyle.BACKGROUND_THICK')
            .fontSize(8)
            .lineHeight(18)
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
          Text('1、蒙层颜色是黄色，dialog左上角显示，dialog的背景呈现远距景深模糊。正常弹出\n' +
            '2、正常关闭自定义弹窗\n' +
            '3、正常关闭自定义弹窗')
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

