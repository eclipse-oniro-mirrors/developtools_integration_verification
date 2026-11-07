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
struct UiComponentTextTextInherit0050 {
  build() {
    Scroll() {
      Column({ space: 20 }) {
        // 标题
        Text('测试0050：Text和Span同时设置属性')
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

          Text('✓ 测试属性继承的优先级规则')
            .fontSize(14)
            .fontColor('#888888')
            .alignSelf(ItemAlign.Start)

          Text('✓ 预期结果：Span设置的属性 > Text设置的属性')
            .fontSize(14)
            .fontColor('#FF6B00')
            .alignSelf(ItemAlign.Start)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFFFFF')
        .borderRadius(10)
        .shadow({ radius: 5, color: '#E0E0E0', offsetX: 2, offsetY: 2 })

        // Text属性设置
        Column({ space: 8 }) {
          Text('Text组件设置的属性：')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor('#CC0000')
            .alignSelf(ItemAlign.Start)

          Text('fontColor: Red, fontSize: 16')
            .fontSize(13)
            .fontColor('#666666')
            .alignSelf(ItemAlign.Start)

          Text('fontWeight: Normal, fontStyle: Italic')
            .fontSize(13)
            .fontColor('#666666')
            .alignSelf(ItemAlign.Start)

          Text('letterSpacing: 2, textCase: UpperCase')
            .fontSize(13)
            .fontColor('#666666')
            .alignSelf(ItemAlign.Start)

          Text('decoration: Underline(Blue)')
            .fontSize(13)
            .fontColor('#666666')
            .alignSelf(ItemAlign.Start)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFE6E6')
        .borderRadius(8)

        // Span属性设置
        Column({ space: 8 }) {
          Text('Span组件设置的属性（会覆盖Text的设置）：')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor('#0066CC')
            .alignSelf(ItemAlign.Start)

          Text('fontColor: Blue, fontSize: 28')
            .fontSize(13)
            .fontColor('#666666')
            .alignSelf(ItemAlign.Start)

          Text('fontWeight: Bolder, fontStyle: Normal')
            .fontSize(13)
            .fontColor('#666666')
            .alignSelf(ItemAlign.Start)

          Text('letterSpacing: 5, textCase: LowerCase')
            .fontSize(13)
            .fontColor('#666666')
            .alignSelf(ItemAlign.Start)

          Text('decoration: LineThrough(Red)')
            .fontSize(13)
            .fontColor('#666666')
            .alignSelf(ItemAlign.Start)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E6F3FF')
        .borderRadius(8)

        // 测试区域
        Column({ space: 10 }) {
          Text('测试内容展示区：')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor('#666666')
            .alignSelf(ItemAlign.Start)

          Text('（应显示Span设置的蓝色、28号、加粗、小写等属性）')
            .fontSize(12)
            .fontColor('#999999')
            .alignSelf(ItemAlign.Start)

          Text() {
            Span('span priority over text')
              .fontColor(Color.Blue)
              .fontSize(28)
              .fontWeight(FontWeight.Bolder)
              .fontStyle(FontStyle.Normal)
              .letterSpacing(5)
              .textCase(TextCase.LowerCase)
              .decoration({ type: TextDecorationType.LineThrough, color: Color.Red })
          }
          .id('text_inherit_0050')
          .fontColor(Color.Red)
          .lineHeight(50)
          .fontSize(16)
          .fontWeight(FontWeight.Normal)
          .fontStyle(FontStyle.Italic)
          .letterSpacing(2)
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
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

