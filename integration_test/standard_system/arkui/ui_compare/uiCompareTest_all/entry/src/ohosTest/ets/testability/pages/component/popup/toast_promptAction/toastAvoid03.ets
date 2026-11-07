/**
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

import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct ToastAvoid03 {
  @State message: string = 'Toast避让测试 - Bottom值调节';
  @State isKeyboardVisible: boolean = false;
  @State bottomValue: number = 80;

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1020')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 });

      Text('测试步骤：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('1、上下调节bottom的值\n2、点击弹出toast，然后调起键盘\n3、观察避让情况')
        .fontSize(12)
        .margin({ bottom: 20 });

      Text('预期效果及校验点：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('各设备可能bottom不是一致的，直板机是284-285，折叠屏是293-294\n在bottom设置为小于等于左边界值的时候，toast是避让键盘的，避让默认80vp\n在bottom设置为大于等于右边界值的时候，toast是不避让键盘的。此时toast的位置减去预留给键盘的位置是大于0的')
        .fontSize(12)
        .margin({ bottom: 30 });

      Row() {
        Button('减少Bottom')
          .onClick(() => {
            this.bottomValue = Math.max(0, this.bottomValue - 20);
          })
          .margin({ right: 10 });

        Text(`Bottom值: ${this.bottomValue}`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ right: 10 });

        Button('增加Bottom')
          .onClick(() => {
            this.bottomValue = Math.min(400, this.bottomValue + 20);
          });
      }
      .margin({ bottom: 20 });

      Button('弹出Toast')
        .id('toastButton_03')
        .onClick(() => {
          promptAction.showToast({
            message: `Bottom值${this.bottomValue}的Toast测试`,
            duration: 3000,
            bottom: this.bottomValue
          });
        })
        .margin({ bottom: 20 });

      Button('拉起键盘')
        .id('keyboardButton_03')
        .onClick(() => {
          this.isKeyboardVisible = !this.isKeyboardVisible;
        })
        .margin({ bottom: 20 });

      if (this.isKeyboardVisible) {
        TextInput({ placeholder: '输入框 - 用于测试键盘避让' })
          .width('90%')
          .height(50)
          .backgroundColor('#F5F5F5')
          .borderRadius(8)
          .margin({ bottom: 20 });
      }

      Text('当前状态：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text(`键盘状态：${this.isKeyboardVisible ? '显示' : '隐藏'}`)
        .fontSize(12)
        .margin({ bottom: 20 });
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#FFFFFF')
    .justifyContent(FlexAlign.Start);
  }
}
