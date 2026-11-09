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
struct PopupMaxWidth0020 {
  build() {
    Row() {
      // popup 高级组件，不设置maxWidth参数，使用默认最大宽度400vp，测试超长文本显示
      Popup({
        // PopupIconOptions类型设置图标内容
        icon: {
          image: $r('app.media.icon'),
          width: 32,
          height: 32,
          fillColor: Color.White,
          borderRadius: 16
        } as PopupIconOptions,
        // PopupTextOptions类型设置标题内容 - 超长标题测试
        title: {
          text: '这是一个非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常长的标题用于测试超长文本在不设置maxWidth时的显示效果标题应该先填充两行如果还没显示完全则会以省略号的形式呈现',
          fontSize: 18,
          fontColor: Color.Black,
          fontWeight: FontWeight.Medium
        } as PopupTextOptions,
        // PopupTextOptions类型设置消息内容 - 超长内容测试
        message: {
          text: '这是一段超长的消息内容文本，用于测试不设置maxWidth时Popup的默认宽度显示效果。当内容超长时，应该自动换行显示，而不是被截断。默认情况下，Popup的最大宽度为400vp（1300px）。在直板机横屏时才能完全显示400vp的宽度。这段文本会持续很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长，以便测试内容的自动换行效果。内容应该在宽度限制内正常换行显示，确保所有文字都能被用户看到，而不是被省略号隐藏。这是测试超长文本显示的重要验证点，需要通过UIViewer工具查看Popup的实际宽度是否为400vp。',
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
    .borderWidth(2)
    .justifyContent(FlexAlign.Center)
  }
}

