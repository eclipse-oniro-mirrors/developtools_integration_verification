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

import { Popup, PopupTextOptions, PopupButtonOptions, PopupIconOptions } from '@kit.ArkUI';

@Entry
@Component
struct PopupMaxWidth0110 {
  build() {
    Row() {
      // popup 高级组件，设置maxWidth为10000（超大值测试）
      Popup({
        // 设置maxWidth为10000（超大值）
        maxWidth: 10000,
        // PopupIconOptions类型设置图标内容
        icon: {
          image: $r('app.media.icon'),
          width: 32,
          height: 32,
          fillColor: Color.White,
          borderRadius: 16
        } as PopupIconOptions,
        // PopupTextOptions类型设置标题内容
        title: {
          text: '验证maxWidth为10000（超大值）',
          fontSize: 18,
          fontColor: Color.Black,
          fontWeight: FontWeight.Medium
        } as PopupTextOptions,
        // PopupTextOptions类型设置消息内容
        message: {
          text: 'maxWidth设置为10000，这是一个超大值，横竖屏都显示不下。Popup应显示为当前容器的最大宽度，在横竖屏下分别自适应显示。',
          fontSize: 14,
          fontColor: Color.Black
        } as PopupTextOptions,
        showClose: false,
        onClose: () => {
          console.info('close Button click');
        },
        // PopupButtonOptions类型设置按钮内容
        buttons: [{
          text: '确定',
          action: () => {
            console.info('confirm button click');
          },
          fontSize: 14,
          fontColor: Color.Black,
        },
        {
          text: '取消',
          action: () => {
            console.info('cancel button click');
          },
          fontSize: 14,
          fontColor: Color.Black
        },] as [PopupButtonOptions?, PopupButtonOptions?]
      })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .padding(20)
  }
}

