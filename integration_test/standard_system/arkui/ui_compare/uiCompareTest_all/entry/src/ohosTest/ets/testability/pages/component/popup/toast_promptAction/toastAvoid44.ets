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
struct ToastAvoid44 {
  @State message: string = 'Toast避让测试 - 隐私模式TopMost Toast';
  @State isKeyboardVisible: boolean = false;

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1440')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 });

      Text('测试步骤：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('1、点击工程里面的DTS2024051714545按钮进入测试页面\n2、点击开启隐私模式\n3、先点击接口拉起TopMost模式的toast在点击输入框\n4、先点击输入框再点击接口拉起TopMost模式的toast\n5、观察toast弹出情况和toast避让情况')
        .fontSize(12)
        .margin({ bottom: 20 });

      Text('预期效果及校验点：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('toast的弹出正常，样式正常。\n如果是先toast后键盘，toast会避让一段距离，显示在键盘上面\n如果是先键盘后toast，toast直接显示在键盘上面')
        .fontSize(12)
        .margin({ bottom: 30 });

      Button('弹出Toast')
        .id('toastButton_44')
        .onClick(() => {
          promptAction.showToast({
            message: '隐私模式TopMost Toast测试',
            duration: 3000
          });
        })
        .margin({ bottom: 20 });

      TextInput({ placeholder: '点击此输入框拉起键盘' })
        .id('keyboardButton_44')
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
