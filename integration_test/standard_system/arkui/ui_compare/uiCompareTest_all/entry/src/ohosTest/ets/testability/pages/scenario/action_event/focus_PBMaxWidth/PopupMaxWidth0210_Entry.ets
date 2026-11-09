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
import { router } from '@kit.ArkUI';

@Entry
@Component
struct PopupMaxWidth0210Entry {
  build() {
    Column() {
      Text('返回再进入测试 - 入口页面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 30 })

      Text('点击按钮跳转到Popup测试页面')
        .fontSize(16)
        .margin({ bottom: 20 })

      Button('进入Popup测试页面')
        .id('enterTestPageButton0210')
        .fontSize(18)
        .width(250)
        .height(60)
        .onClick(() => {
          console.info('Navigating to PopupMaxWidth0210_Test page');
          router.pushUrl({
            url: 'testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0210_Test'
          }).then(() => {
            console.info('Navigation to test page successful');
          }).catch((err: Error) => {
            console.error('Navigation to test page failed: ' + err.message);
          });
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#F5F5F5')
  }
}

