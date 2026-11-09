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
struct PreviewBasic0230 {
  controller: TextAreaController = new TextAreaController();
  @State inputValue: string = '';

  // 自定义键盘组件
  @Builder CustomKeyboardBuilder() {
    Column() {
      Button('x').onClick(() => {
        // 关闭自定义键盘
        this.controller.stopEditing();
      })
      Grid() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'], (item: number | string) => {
          GridItem() {
            Button(item + '')
              .width(110).onClick(() => {
              this.inputValue += item;
            })
          }
        })
      }.maxCount(3).columnsGap(10).rowsGap(10).padding(5)
    }.backgroundColor(Color.Gray)
  }

  build() {
    Column({ space: 20 }) {
      Text('TextArea 自定义键盘示例')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 30, bottom: 10 })

      Column({ space: 10 }) {
        Text('增强样式（点击弹出自定义键盘）')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .alignSelf(ItemAlign.Start)
          .margin({ left: 10 })

        TextArea({ controller: this.controller, text: this.inputValue, placeholder: '点击输入数字' })
          .customKeyboard(this.CustomKeyboardBuilder())
          .width('95%')
          .height(200)
          .margin(10)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#2196F3')
          .backgroundColor('#E3F2FD')
          .border({
            width: 3,
            color: '#1976D2',
            radius: 16,
            style: BorderStyle.Solid
          })
          .padding(20)
          .borderRadius(16)
          .placeholderColor('#90CAF9')
          .placeholderFont({
            size: 18,
            weight: FontWeight.Medium,
            style: FontStyle.Italic
          })
          .textAlign(TextAlign.Center)
          .caretColor('#FF5722')
          .caretStyle({ width: 3 })
          .maxLength(50)
          .showCounter(true)
          .barState(BarState.On)
          .maxLines(5)
          .copyOption(CopyOptions.InApp)
          .selectedBackgroundColor('#BBDEFB')
          .onChange((value: string) => {
            this.inputValue = value;
          })

        Text(`已输入: ${this.inputValue.length}/50 字符`)
          .fontSize(14)
          .fontColor('#1976D2')
          .margin({ top: 5, left: 10 })

        Button('清空内容')
          .width('90%')
          .height(40)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .backgroundColor('#E3F2FD')
          .fontColor('#1976D2')
          .borderRadius(12)
          .border({ width: 2, color: '#90CAF9' })
          .margin({ top: 10 })
          .onClick(() => {
            this.inputValue = '';
          })
      }
      .width('95%')
      .backgroundColor(Color.White)
      .borderRadius(12)
      .padding(10)
      .shadow({
        radius: 10,
        color: '#00000020',
        offsetX: 0,
        offsetY: 4
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
