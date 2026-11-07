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
struct PopupMaxWidth0040 {
  @State currentMaxWidth: number | undefined = -9.9;
  @State maxWidthText: string = '-9.9';

  // 切换maxWidth的方法：从-9.9切换到undefined
  switchMaxWidth() {
    if (this.currentMaxWidth === -9.9) {
      this.currentMaxWidth = undefined;
      this.maxWidthText = 'undefined';
    } else {
      this.currentMaxWidth = -9.9;
      this.maxWidthText = '-9.9';
    }
  }

  build() {
    Column() {
      // 切换按钮
      Button(`切换maxWidth (当前: ${this.maxWidthText})`)
        .id('switchMaxWidthButton0040')
        .onClick(() => {
          this.switchMaxWidth();
        })
        .margin({ bottom: 20 })
        .fontSize(16)

      // Popup显示区域
      Row() {
        Popup({
          // 设置maxWidth属性 - 从-9.9切换到undefined
          maxWidth: this.currentMaxWidth,
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
            text: `当前maxWidth: ${this.maxWidthText}`,
            fontSize: 18,
            fontColor: Color.Black,
            fontWeight: FontWeight.Medium
          } as PopupTextOptions,
          // PopupTextOptions类型设置消息内容
          message: {
            text: '这是一段正常的文本内容，用于测试手动切换maxWidth从-9.9到undefined时Popup宽度的变化效果。初始maxWidth为-9.9，点击切换按钮后maxWidth设置为undefined。两种情况下Popup都应该保持默认宽度400vp。',
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
      .height('32.79%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .padding(20)
  }
}

