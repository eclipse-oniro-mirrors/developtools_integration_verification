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

import { promptAction, LengthMetrics, PromptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct ToastPromptAction05 {
  @State toastId1: number = 0;
  @State toastId2: number = 0;
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();

  build() {
    Column() {
      // 页面标题
      Text('测试用例0050 - 多个Toast组件Default/Top_Most/SYSTEM_Top_Most showMode')
        .height(50)
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('100%')
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 8, bottom: 8 });

      // 状态说明
      Text('showMode: Default/Top_Most/SYSTEM_Top_Most - 同一类型的Toast只能打开一个')
        .height(35)
        .fontSize(12)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('100%')
        .border({ width: 1 })
        .lineHeight(16)
        .fontWeight(300)
        .margin({ bottom: 8 });

      // 操作按钮
      Row({ space: 10 }) {
        Button('Toast1')
          .id('toast1_button_05')
          .type(ButtonType.Capsule)
          .height(100)
          .onClick(() => {
            try {
              this.promptAction.openToast({
                message: '这是第一个Toast消息',
                duration: 1500,
                showMode: promptAction.ToastShowMode.DEFAULT
              }).then((toastId: number) => {
                this.toastId1 = toastId;
              });
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`OpenToast error code is ${code}, message is ${message}`);
            }
          })
        Button('Toast2')
          .id('toast2_button_05')
          .type(ButtonType.Capsule)
          .height(100)
          .onClick(() => {
            try {
              this.promptAction.openToast({
                message: '这是第二个Toast消息',
                duration: 1500,
                showMode: promptAction.ToastShowMode.TOP_MOST
              }).then((toastId: number) => {
                this.toastId2 = toastId;
              });
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`OpenToast error code is ${code}, message is ${message}`);
            }
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: 10 });

      // 关闭按钮
      Row({ space: 10 }) {
        Button('Close1')
          .id('close1_button_05')
          .type(ButtonType.Capsule)
          .height(100)
          .onClick(() => {
            try {
              this.promptAction.closeToast(this.toastId1);
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`CloseToast error code is ${code}, message is ${message}`);
            }
          })
        Button('Close2')
          .id('close2_button_05')
          .type(ButtonType.Capsule)
          .height(100)
          .onClick(() => {
            try {
              this.promptAction.closeToast(this.toastId2);
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`CloseToast error code is ${code}, message is ${message}`);
            }
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: 10 });

      // 说明文字
      Text('依次启动多个Toast，然后依次关闭Toast')
        .fontSize(14)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .width('90%')
        .margin({ top: 20 });

      // 测试区域
      Column({ space: 20 }) {
        Text('测试说明：')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Blue)
          .width('100%')
          .textAlign(TextAlign.Center);

        Text('1. 点击Toast1和Toast2依次启动多个Toast')
          .fontSize(14)
          .fontColor(Color.Black)
          .width('100%')
          .textAlign(TextAlign.Start);

        Text('2. 点击Close1和Close2依次关闭Toast')
          .fontSize(14)
          .fontColor(Color.Black)
          .width('100%')
          .textAlign(TextAlign.Start);

        Text('3. 预期效果：同一类型的Toast只能打开一个')
          .fontSize(14)
          .fontColor(Color.Green)
          .width('100%')
          .textAlign(TextAlign.Start);
      }
      .width('90%')
      .padding(15)
      .backgroundColor(0xF5F5F5)
      .borderRadius(10)
      .margin({ top: 20 });
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5, left: 10, right: 10 })
  }
}
