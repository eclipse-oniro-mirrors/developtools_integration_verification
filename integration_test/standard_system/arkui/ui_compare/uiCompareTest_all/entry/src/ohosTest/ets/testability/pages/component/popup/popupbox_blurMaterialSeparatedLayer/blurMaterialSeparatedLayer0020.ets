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

@Entry
@Component
struct BlurMaterialSeparatedLayer0020 {
  build() {
    Column() {
      Text('警告弹窗')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Button('两个按钮')
        .id('twoButtonsBtn0020')
        .width(300)
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.getUIContext().showAlertDialog({
            title: 'AlertDialog',
            message: '这是两个按钮的AlertDialog',
            autoCancel: true,
            alignment: DialogAlignment.Center,
            backgroundBlurStyle: BlurStyle.BACKGROUND_THICK,
            primaryButton: {
              value: '确定',
              action: () => {
                console.info('Primary button clicked');
              }
            },
            secondaryButton: {
              value: '取消',
              action: () => {
                console.info('Secondary button clicked');
              }
            },
            cancel: () => {
              console.info('Dialog cancelled');
            }
          });
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F5F5F5')
  }
}

