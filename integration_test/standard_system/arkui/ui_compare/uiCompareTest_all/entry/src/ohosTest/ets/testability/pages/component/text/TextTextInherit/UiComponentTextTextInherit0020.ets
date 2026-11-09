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
struct UiComponentTextTextInherit0020 {
  build() {
    Column({ space: 20 }) {
      // 标题
      Text('测试0020：仅Text组件设定属性')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor('#333333')
        .margin({ top: 10 })

      // 说明区域
      Column({ space: 10 }) {
        Text('测试说明：')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor('#666666')
          .alignSelf(ItemAlign.Start)

        Text('✓ Text组件设置了以下属性：')
          .fontSize(14)
          .fontColor('#888888')
          .alignSelf(ItemAlign.Start)

        Text('  fontColor: Red, fontSize: 24, fontWeight: Bold')
          .fontSize(12)
          .fontColor('#999999')
          .alignSelf(ItemAlign.Start)

        Text('  fontStyle: Italic, letterSpacing: 3')
          .fontSize(12)
          .fontColor('#999999')
          .alignSelf(ItemAlign.Start)

        Text('  textCase: UpperCase, decoration: Underline')
          .fontSize(12)
          .fontColor('#999999')
          .alignSelf(ItemAlign.Start)

        Text('✓ Span组件未设置任何属性')
          .fontSize(14)
          .fontColor('#888888')
          .alignSelf(ItemAlign.Start)

        Text('✓ 预期结果：Span继承Text的所有属性')
          .fontSize(14)
          .fontColor('#FF6B00')
          .alignSelf(ItemAlign.Start)
      }
      .width('90%')
      .padding(15)
      .backgroundColor('#FFFFFF')
      .borderRadius(10)
      .shadow({ radius: 5, color: '#E0E0E0', offsetX: 2, offsetY: 2 })

      // 测试区域
      Column({ space: 10 }) {
        Text('测试内容展示区：')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#666666')
          .alignSelf(ItemAlign.Start)

        Text() {
          Span('Span继承Text属性后的显示效果')
        }
        .id('text_inherit_0020')
        .fontColor(Color.Red)
        .lineHeight(40)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontStyle(FontStyle.Italic)
        .letterSpacing(3)
        .textCase(TextCase.UpperCase)
        .decoration({ type: TextDecorationType.Underline, color: Color.Blue })
        .width('100%')
        .padding(15)
        .backgroundColor('#FFF9E6')
        .borderRadius(8)
        .border({ width: 2, color: '#FFD700' })
      }
      .width('90%')
      .padding(15)
      .backgroundColor('#FFFFFF')
      .borderRadius(10)
      .shadow({ radius: 5, color: '#E0E0E0', offsetX: 2, offsetY: 2 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}

