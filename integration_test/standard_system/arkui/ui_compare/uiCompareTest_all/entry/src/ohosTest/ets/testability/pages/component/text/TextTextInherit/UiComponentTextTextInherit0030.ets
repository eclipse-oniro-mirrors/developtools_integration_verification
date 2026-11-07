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
struct UiComponentTextTextInherit0030 {
  build() {
    Column({ space: 20 }) {
      // 标题
      Text('测试0030：仅Span组件设定属性')
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

        Text('✓ Text组件未设置任何样式属性')
          .fontSize(14)
          .fontColor('#888888')
          .alignSelf(ItemAlign.Start)

        Text('✓ Span组件设置了以下属性：')
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

        Text('✓ 预期结果：文本显示Span自己设置的属性')
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
          Span('Span设置自己的属性后的显示效果')
            .fontColor(Color.Red)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontStyle(FontStyle.Italic)
            .letterSpacing(3)
            .textCase(TextCase.UpperCase)
            .decoration({ type: TextDecorationType.Underline, color: Color.Blue })
        }
        .id('text_inherit_0030')
        .lineHeight(40)
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

      // 对比说明
      Column({ space: 8 }) {
        Text('对比说明：')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#666666')
          .alignSelf(ItemAlign.Start)

        Text('与测试0020的区别：')
          .fontSize(14)
          .fontColor('#888888')
          .alignSelf(ItemAlign.Start)

        Text('• 0020: Text设置属性 → Span继承')
          .fontSize(13)
          .fontColor('#666666')
          .alignSelf(ItemAlign.Start)

        Text('• 0030: Span自己设置属性 → Span使用自己的')
          .fontSize(13)
          .fontColor('#666666')
          .alignSelf(ItemAlign.Start)

        Text('• 最终显示效果应该相同')
          .fontSize(13)
          .fontColor('#FF6B00')
          .fontWeight(FontWeight.Medium)
          .alignSelf(ItemAlign.Start)
      }
      .width('90%')
      .padding(15)
      .backgroundColor('#E8F5E9')
      .borderRadius(8)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}

