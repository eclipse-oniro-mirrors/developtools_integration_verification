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
struct ToastAvoid50 {
  @State message: string = 'Toast避让测试 - BottomStart避让键盘';
  @State isKeyboardVisible: boolean = false;

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_0930')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 });

      Text('测试步骤：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('1、alignment设置为BottomStart的情况下，bottom设置为80\n2、点击弹出toast，拉起键盘\n3、观察toast的显示和避让情况')
        .fontSize(12)
        .margin({ bottom: 20 });

      Text('预期效果及校验点：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('在设置了alignment的情况下，bottom不生效。\n所以toast在左下角显示，避让导航条，显示完整\n拉起键盘，toast避让键盘80vp')
        .fontSize(12)
        .margin({ bottom: 30 });

      Button('弹出Toast')
        .id('toastButton_50')
        .onClick(() => {
          promptAction.showToast({
            message: 'BottomStart避让键盘Toast测试',
            duration: 3000,
            alignment: Alignment.BottomStart,
            bottom: 80
          });
        })
        .margin({ bottom: 20 });

      TextInput({ placeholder: '点击此输入框拉起键盘' })
        .id('keyboardButton_50')
        .width('90%')
        .height(50)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .margin({ bottom: 20 })
        .onFocus(() => {
          this.isKeyboardVisible = true;
        })
        .onBlur(() => {
          this.isKeyboardVisible = false;
        });

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
