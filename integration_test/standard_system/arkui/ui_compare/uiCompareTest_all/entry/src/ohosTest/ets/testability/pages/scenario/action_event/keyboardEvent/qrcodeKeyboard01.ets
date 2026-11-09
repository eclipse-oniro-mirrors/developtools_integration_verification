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
struct QrcodeKeyboard01 {
  build() {
    Column({ space: 20 }) {
      Text('QRCode键盘Tab和上下键测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      // 多个QRCode组件
      QRCode('QRCode 1')
        .id('qrcode_01')
        .width(120)
        .height(120)
        .focusable(true)
        .margin({ bottom: 15 })

      QRCode('QRCode 2')
        .id('qrcode_02')
        .width(120)
        .height(120)
        .focusable(true)
        .margin({ bottom: 15 })

      QRCode('QRCode 3')
        .id('qrcode_03')
        .width(120)
        .height(120)
        .focusable(true)
        .margin({ bottom: 15 })

      Text('预期效果：按Tab键和上下键，可以正常获焦到对应的二维码上')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F3F4F6')
  }
}
