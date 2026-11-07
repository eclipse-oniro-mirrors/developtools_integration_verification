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
struct ToastAvoid30 {
  @State message: string = 'Toast避让测试 - TopMost模式主题';
  @State isDarkMode: boolean = false;

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPT_TOASTAVOID_1300')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 });

      Text('测试步骤：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('1、点击topMost，在浅色模式的情况下弹出toast\n2、在深色模式的情况下弹出toast\n3、深浅色来回切换，弹出toast\n4、观察topMost模式的toast的样式')
        .fontSize(12)
        .margin({ bottom: 20 });

      Text('预期效果及校验点：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('toast的样式正常，在浅色模式是黑底白字，在深色模式是白底黑字')
        .fontSize(12)
        .margin({ bottom: 30 });

      Button('弹出Toast')
        .id('toastButton_30')
        .onClick(() => {
          promptAction.showToast({
            message: 'TopMost模式Toast测试',
            duration: 3000
          });
        })
        .margin({ bottom: 20 });

      Button('切换主题')
        .onClick(() => {
          this.isDarkMode = !this.isDarkMode;
        })
        .margin({ bottom: 20 });

      Text('当前主题：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text(`主题模式：${this.isDarkMode ? '深色模式' : '浅色模式'}`)
        .fontSize(12)
        .margin({ bottom: 20 });
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(this.isDarkMode ? '#1C1C1E' : '#FFFFFF')
    .justifyContent(FlexAlign.Start);
  }
}
