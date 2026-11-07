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
struct UiComponentTextTextInherit0070 {
  @State textFontSize: number = 16
  @State textLineHeight: number = 20
  @State textLetterSpacing: number = 0

  build() {
    Column({ space: 20 }) {
      // 标题
      Text('测试0070：动态改变Text属性')
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

        Text('✓ Span组件未设置fontSize、lineHeight、letterSpacing')
          .fontSize(14)
          .fontColor('#888888')
          .alignSelf(ItemAlign.Start)

        Text('✓ 点击按钮动态改变Text组件的属性值')
          .fontSize(14)
          .fontColor('#888888')
          .alignSelf(ItemAlign.Start)

        Text('✓ 预期结果：Span能实时继承Text的属性变化')
          .fontSize(14)
          .fontColor('#FF6B00')
          .alignSelf(ItemAlign.Start)
      }
      .width('90%')
      .padding(15)
      .backgroundColor('#FFFFFF')
      .borderRadius(10)
      .shadow({ radius: 5, color: '#E0E0E0', offsetX: 2, offsetY: 2 })

      // 当前属性值显示
      Column({ space: 8 }) {
        Text('当前属性值：')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#666666')
          .alignSelf(ItemAlign.Start)

        Text(`fontSize: ${this.textFontSize}px`)
          .fontSize(14)
          .fontColor('#0066CC')
          .alignSelf(ItemAlign.Start)

        Text(`lineHeight: ${this.textLineHeight}px`)
          .fontSize(14)
          .fontColor('#0066CC')
          .alignSelf(ItemAlign.Start)

        Text(`letterSpacing: ${this.textLetterSpacing}px`)
          .fontSize(14)
          .fontColor('#0066CC')
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

        Text() {
          Span('Span继承Text的动态属性变化效果')
        }
        .id('text_inherit_0070')
        .fontSize(this.textFontSize)
        .lineHeight(this.textLineHeight)
        .letterSpacing(this.textLetterSpacing)
        .fontColor('#333333')
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

      // 操作按钮区域
      Column({ space: 12 }) {
        Text('操作按钮：')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#666666')
          .alignSelf(ItemAlign.Start)

        Button('改变fontSize (16→24)')
          .id('btn_change_fontsize_0070')
          .onClick(() => {
            this.textFontSize = 24
          })
          .width('100%')
          .backgroundColor('#4CAF50')
          .fontSize(16)

        Button('改变lineHeight (20→40)')
          .id('btn_change_lineheight_0070')
          .onClick(() => {
            this.textLineHeight = 40
          })
          .width('100%')
          .backgroundColor('#2196F3')
          .fontSize(16)

        Button('改变letterSpacing (0→3)')
          .id('btn_change_letterspacing_0070')
          .onClick(() => {
            this.textLetterSpacing = 3
          })
          .width('100%')
          .backgroundColor('#FF9800')
          .fontSize(16)
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

