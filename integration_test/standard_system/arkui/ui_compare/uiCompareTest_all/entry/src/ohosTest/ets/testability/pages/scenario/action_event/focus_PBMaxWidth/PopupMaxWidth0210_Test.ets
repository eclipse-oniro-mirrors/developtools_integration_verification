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

import { Popup, PopupTextOptions, PopupButtonOptions, PopupIconOptions, router } from '@kit.ArkUI';


@Entry
@Component
struct PopupMaxWidth0210Test {
  aboutToAppear() {
    console.info('PopupMaxWidth0210Test page aboutToAppear');
  }

  aboutToDisappear() {
    console.info('PopupMaxWidth0210Test page aboutToDisappear');
  }

  build() {
    Column() {
      // 返回按钮
      Row() {
        Button('← 返回上一页')
          .id('backButton0210')
          .fontSize(16)
          .width(150)
          .height(40)
          .margin({ left: 20, top: 20 })
          .onClick(() => {
            console.info('Back button clicked, returning to entry page');
            router.back();
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)

      // Popup显示区域
      Row() {
        // popup 高级组件，设置maxWidth为300vp
        Popup({
          // 设置maxWidth为300vp
          maxWidth: '300vp',
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
            text: '验证返回再进入后maxWidth为300vp',
            fontSize: 18,
            fontColor: Color.Black,
            fontWeight: FontWeight.Medium
          } as PopupTextOptions,
          // PopupTextOptions类型设置消息内容
          message: {
            text: 'maxWidth设置为300vp,测试返回上一页再进入后,Popup宽度仍为300vp,文本正常显示。点击"返回上一页"按钮返回,然后再次点击"进入Popup测试页面"按钮进入。',
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
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }
}

