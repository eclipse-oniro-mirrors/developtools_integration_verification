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
struct UiComponentTextRichEditorInterface38 {
  controller: RichEditorController = new RichEditorController();
  @State menuInfo: string = '请长按文本选择文本'
  @State appearInfo: string = ''
  @State disappearInfo: string = ''

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1490')
        .fontSize(14)
        .fontColor(0x666666)
        .margin({ bottom: 10 })

      Text('bindSelectionMenu长按选择文本测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.menuInfo)
        .fontSize(16)
        .fontColor(Color.Green)
        .backgroundColor(0xE8F5E8)
        .padding(10)
        .border({ width: 1, color: Color.Green, radius: 8 })
        .width('90%')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 10 })

      Text(this.appearInfo)
        .fontSize(12)
        .fontColor(Color.Blue)
        .backgroundColor(0xE3F2FD)
        .padding(5)
        .width('90%')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 5 })

      Text(this.disappearInfo)
        .fontSize(12)
        .fontColor(Color.Orange)
        .backgroundColor(0xFFF3E0)
        .padding(5)
        .width('90%')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 20 })

      RichEditor({ controller: this.controller })
        .id('UiComponentTextRichEditorInterface38')
        .draggable(true)
        .onReady(() => {
          this.controller.addTextSpan('长按下面的文本进行选择：', {
            style: {
              fontColor: Color.Black,
              fontSize: 16
            }
          })

          this.controller.addTextSpan('\n', {
            style: {
              fontColor: 0xCCCCCC,
              fontSize: 12,
            }
          })
          this.controller.addTextSpan('——————————————', {
            style: {
              fontColor: 0xCCCCCC,
              fontSize: 14,
              fontWeight: FontWeight.Medium,
              letterSpacing: 2
            }
          })
          this.controller.addTextSpan('\n', {
            style: {
              fontColor: 0xCCCCCC,
              fontSize: 12,
            }
          })

          this.controller.addTextSpan('这是可选择的测试文本，长按我可以弹出自定义菜单。', {
            style: {
              fontColor: Color.Red,
              fontSize: 18,
              fontWeight: FontWeight.Bold,
              decoration: { type: TextDecorationType.Underline, color: Color.Red }
            }
          })

          this.controller.addTextSpan('\n', {
            style: {
              fontColor: 0xCCCCCC,
              fontSize: 12,
            }
          })
          this.controller.addTextSpan('——————————————', {
            style: {
              fontColor: 0xCCCCCC,
              fontSize: 14,
              fontWeight: FontWeight.Medium,
              letterSpacing: 2
            }
          })
          this.controller.addTextSpan('\n', {
            style: {
              fontColor: 0xCCCCCC,
              fontSize: 12,
            }
          })

          this.controller.addTextSpan('这是普通文字', {
            style: {
              fontColor: Color.Black,
              fontSize: 16
            }
          })
        })
        .bindSelectionMenu(
          RichEditorSpanType.TEXT,
          this.LongPressTextCustomMenu,
          ResponseType.LongPress,
          {
            onAppear: () => {
              this.appearInfo = `菜单出现时间: ${new Date().toLocaleTimeString()}`
              console.info(`自定义选择菜单弹出时回调`);
            },
            onDisappear: () => {
              this.disappearInfo = `菜单消失时间: ${new Date().toLocaleTimeString()}`
              console.info(`自定义选择菜单关闭时回调`);
            }
          }
        )
        .borderWidth(2)
        .borderColor(Color.Gray)
        .width('90%')
        .height(250)
        .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  LongPressTextCustomMenu() {
    Column() {
      Menu() {
        MenuItemGroup() {
          MenuItem({
            startIcon: $r('app.media.icon'),
            content: '复制文本'
          })
            .onClick(() => {
              this.menuInfo = `点击了"复制文本"菜单项 时间: ${new Date().toLocaleTimeString()}`
              console.log('复制文本菜单项被点击')
              this.controller.closeSelectionMenu();
            })

          MenuItem({
            startIcon: $r('app.media.icon'),
            content: '删除文本'
          })
            .onClick(() => {
              this.menuInfo = `点击了"删除文本"菜单项 时间: ${new Date().toLocaleTimeString()}`
              console.log('删除文本菜单项被点击')
              this.controller.closeSelectionMenu();
            })

          MenuItem({
            startIcon: $r('app.media.icon'),
            content: '分享文本'
          })
            .onClick(() => {
              this.menuInfo = `点击了"分享文本"菜单项 时间: ${new Date().toLocaleTimeString()}`
              console.log('分享文本菜单项被点击')
              this.controller.closeSelectionMenu();
            })

          MenuItem({
            startIcon: $r('app.media.icon'),
            content: '翻译文本'
          })
            .onClick(() => {
              this.menuInfo = `点击了"翻译文本"菜单项 时间: ${new Date().toLocaleTimeString()}`
              console.log('翻译文本菜单项被点击')
              this.controller.closeSelectionMenu();
            })
        }
      }
    }
  }
}
