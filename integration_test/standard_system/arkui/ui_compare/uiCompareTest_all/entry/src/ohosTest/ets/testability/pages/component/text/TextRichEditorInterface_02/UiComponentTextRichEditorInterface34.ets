/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct UiComponentTextRichEditorInterface34 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  @State message: string = 'TextSpan长按事件测试页面'
  @State longPressInfo: string = '暂无长按事件'
  @State clickInfo: string = '暂无点击事件'
  @State spanCount: number = 0

  build() {
    Column() {

      Column() {
        Text(this.message)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)
          .width('100%')
          .textAlign(TextAlign.Center)
          .padding(10)
          .backgroundColor(0xF0F0F0)
      }
      .borderWidth(1)
      .borderColor(Color.Gray)
      .width('100%')
      .height('10%')

      Column() {
        Text('长按事件信息:')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 5 })

        Text(this.longPressInfo)
          .fontSize(12)
          .fontColor(Color.Blue)
          .backgroundColor(0xEEEEFF)
          .padding(8)
          .width('100%')
          .border({ width: 1, color: Color.Blue, radius: 4 })

        Text('点击事件信息:')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 5, top: 10 })

        Text(this.clickInfo)
          .fontSize(12)
          .fontColor(Color.Green)
          .backgroundColor(0xEEFFEE)
          .padding(8)
          .width('100%')
          .border({ width: 1, color: Color.Green, radius: 4 })
      }
      .padding(15)
      .borderWidth(1)
      .borderColor(Color.Orange)
      .width('100%')
      .height('25%')

      // 操作按钮区域
      Row() {
        Button('添加TextSpan')
          .fontSize(12)
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .fontWeight(FontWeight.Medium)
          .onClick(() => {
            this.addTextSpanWithEvents()
          })
          .margin({ right: 10 })

        Button('清空内容')
          .fontSize(12)
          .borderRadius(8)
          .backgroundColor(0xff7a31)
          .fontWeight(FontWeight.Medium)
          .onClick(() => {
            this.clearContent()
          })
          .margin({ right: 10 })

        Button('重置信息')
          .fontSize(12)
          .borderRadius(8)
          .backgroundColor(0x31ff7a)
          .fontWeight(FontWeight.Medium)
          .onClick(() => {
            this.resetInfo()
          })
      }
      .justifyContent(FlexAlign.Center)
      .padding(10)
      .borderWidth(1)
      .borderColor(Color.Blue)
      .width('100%')
      .height('12%')

      Column() {
        Text('RichEditor - 长按下方的TextSpan测试长按事件')
          .fontSize(14)
          .fontColor(0x666666)
          .margin({ bottom: 10 })

        RichEditor(this.options)
          .id('UiComponentTextRichEditorInterface34')
          .onReady(() => {
            this.addInitialContent()
          })
          .onSelect((value: RichEditorSelection) => {
            console.log('选择文本范围: [' + value.selection[0] + ', ' + value.selection[1] + ']')
          })
          .placeholder('请添加TextSpan进行测试...', {
            fontColor: Color.Gray,
            font: {
              size: 16,
              weight: FontWeight.Normal,
              style: FontStyle.Normal
            }
          })
          .borderWidth(2)
          .borderColor(Color.Green)
          .borderRadius(8)
          .width('100%')
          .height('100%')
          .padding(10)
      }
      .padding(15)
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('53%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xFFFFF0)
  }

  private addTextSpanWithEvents() {
    this.spanCount++
    const spanText = `可长按的文本片段${this.spanCount} `

    this.controller.addTextSpan(spanText, {
      style: {
        fontColor: Color.Red,
        fontSize: 16,
        fontWeight: FontWeight.Bold,
        decoration: { type: TextDecorationType.Underline, color: Color.Red }
      },
      gesture: {
        onLongPress: () => {
          this.longPressInfo = `长按了TextSpan: "${spanText}" (时间: ${new Date().toLocaleTimeString()})`
          console.log('TextSpan长按事件触发: ' + spanText)
        },
        onClick: () => {
          this.clickInfo = `点击了TextSpan: "${spanText}" (时间: ${new Date().toLocaleTimeString()})`
          console.log('TextSpan点击事件触发: ' + spanText)
        }
      }
    })

    this.controller.addTextSpan('这是普通文本。', {
      style: {
        fontColor: Color.Black,
        fontSize: 14
      }
    })
  }

  private addInitialContent() {
    this.controller.addTextSpan('欢迎使用TextSpan长按事件测试！\n\n', {
      style: {
        fontColor: Color.Black,
        fontSize: 16,
        fontWeight: FontWeight.Bold
      }
    })

    this.addTextSpanWithEvents()
  }

  private clearContent() {
    this.controller.deleteSpans({ start: 0, end: -1 })
    this.spanCount = 0
    this.longPressInfo = '内容已清空'
    this.clickInfo = '内容已清空'
  }

  private resetInfo() {
    this.longPressInfo = '暂无长按事件'
    this.clickInfo = '暂无点击事件'
  }
}