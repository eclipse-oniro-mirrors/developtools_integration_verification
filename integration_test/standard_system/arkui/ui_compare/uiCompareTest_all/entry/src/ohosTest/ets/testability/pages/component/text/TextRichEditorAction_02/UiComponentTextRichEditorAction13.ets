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
struct UiComponentTextRichEditorAction13 {
  controller: RichEditorController = new RichEditorController();

  @State statusInfo: string = '测试流程：1.输入文字或拼音 → 2.调整padding观察光标'
  @State paddingInfo: string = '当前padding: 10px'
  @State cursorInfo: string = '光标位置信息'
  @State inputInfo: string = '暂无输入'
  @State currentPadding: number = 10
  @State hasFocus: boolean = false

  build() {
    Column() {
      Column({ space: 10 }) {
        Text('Padding调整控制')
          .fontSize(14)
          .fontColor(Color.Red)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Medium)
          .fontColor(0x333333)

        Row({ space: 15 }) {
          Button('减少Padding(-5)')
            .fontSize(11)
            .height(35)
            .backgroundColor(0xFF5722)
            .fontColor(Color.White)
            .fontStyle(FontStyle.Italic)
            .borderRadius(6)
            .flexGrow(1)
            .id('UiComponentTextRichEditorAction13_DecreasePadding')
            .onClick(() => {
              this.decreasePadding()
            })

          Text(`${this.currentPadding}px`)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor(0x333333)
            .textAlign(TextAlign.Center)
            .width(60)
            .backgroundColor(0xE0E0E0)
            .borderRadius(4)
            .padding(8)

          Button('增加Padding(+5)')
            .fontSize(11)
            .height(35)
            .backgroundColor(0x4CAF50)
            .fontColor(Color.White)
            .borderRadius(6)
            .flexGrow(1)
            .id('UiComponentTextRichEditorAction13_IncreasePadding')
            .onClick(() => {
              this.increasePadding()
            })
        }
        .width('100%')

        Row({ space: 15 }) {
          Button('重置Padding(10)')
            .fontSize(11)
            .height(35)
            .backgroundColor(0x2196F3)
            .fontColor(Color.White)
            .borderRadius(6)
            .flexGrow(1)
            .onClick(() => {
              this.resetPadding()
            })

          Button('极限测试(50)')
            .fontSize(11)
            .height(35)
            .backgroundColor(0x9C27B0)
            .fontColor(Color.White)
            .borderRadius(6)
            .flexGrow(1)
            .onClick(() => {
              this.setLargePadding()
            })
        }
        .width('100%')
      }
      .padding(15)
      .backgroundColor(0xF5F5F5)
      .borderRadius(8)
      .width('90%')
      .margin({ bottom: 15 })

      Column() {
        Text('在下方编辑器中输入文字或拼音，然后调整padding观察光标')
          .fontSize(12)
          .fontColor(0x333333)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 8 })
          .textAlign(TextAlign.Center)

        RichEditor({ controller: this.controller })
          .id('UiComponentTextRichEditorAction13_Editor')
          .onReady(() => {
            this.statusInfo = '编辑器已准备就绪，请输入文字测试光标位置'
            this.controller.addTextSpan('hello',
              {
                style:
                {
                  fontColor: Color.Orange,
                }
              })
            this.updateCursorInfo()
            console.log('RichEditor已准备就绪')
          })
          .onFocus(() => {
            this.hasFocus = true
            this.statusInfo = '编辑器已获得焦点，可以输入文字和调整padding'
            this.updateCursorInfo()
            console.log('RichEditor获得焦点')
          })
          .onBlur(() => {
            this.hasFocus = false
            this.statusInfo = '编辑器失去焦点，点击可重新激活'
            console.log('RichEditor失去焦点')
          })
          .aboutToIMEInput((value: RichEditorInsertValue) => {
            this.inputInfo = `即将输入: "${value.insertValue}" 位置: ${value.insertOffset}`
            this.updateCursorInfo()
            console.log('即将输入:', value.insertValue)
            return true
          })
          .onIMEInputComplete((value: RichEditorTextSpanResult) => {
            this.inputInfo = `输入完成: "${value.value}" | 光标适应padding: ${this.currentPadding}px`
            this.updateCursorInfo()
            console.log('输入完成:', value.value)
          })
          .onSelect((value: RichEditorSelection) => {
            this.cursorInfo = `文本选中: [${value.selection[0]}, ${value.selection[1]}] | padding: ${this.currentPadding}px`
            console.log('文本选中:', value.selection)
          })
          .placeholder('请输入文字或拼音进行测试...', {
            fontColor: Color.Gray,
            font: {
              size: 16,
              weight: FontWeight.Normal,
              style: FontStyle.Normal
            }
          })
          .borderWidth(2)
          .borderColor(this.hasFocus ? Color.Blue : Color.Gray)
          .borderRadius(8)
          .width('100%')
          .height(150)
          .padding(this.currentPadding)
          .backgroundColor(Color.White)
      }
      .width('90%')
      .margin({ bottom: 15 })

      Text('测试说明：\n1. 点击编辑器输入中文、英文或拼音\n2. 使用按钮调整padding数值\n3. 观察光标位置是否随padding正确调整\n4. 验证不同padding下的光标显示效果')
        .fontSize(10)
        .fontColor(0x888888)
        .textAlign(TextAlign.Start)
        .width('90%')
        .lineHeight(14)
        .backgroundColor(0xFAFAFA)
        .padding(8)
        .borderRadius(6)

    }
    .width('100%')
    .height('100%')
    .padding(15)
    .justifyContent(FlexAlign.Start)
    .backgroundColor(0xF9F9F9)
  }

  private increasePadding() {
    if (this.currentPadding < 60) {
      this.currentPadding += 5
      this.paddingInfo = `当前padding: ${this.currentPadding}px`
      this.statusInfo = `Padding已增加到${this.currentPadding}px，观察光标位置变化`
      this.updateCursorInfo()
      console.log(`Padding增加到: ${this.currentPadding}px`)
    } else {
      this.statusInfo = 'Padding已达到最大值(60px)，无法继续增加'
    }
  }

  private decreasePadding() {
    if (this.currentPadding > 0) {
      this.currentPadding -= 5
      this.paddingInfo = `当前padding: ${this.currentPadding}px`
      this.statusInfo = `Padding已减少到${this.currentPadding}px，观察光标位置变化`
      this.updateCursorInfo()
      console.log(`Padding减少到: ${this.currentPadding}px`)
    } else {
      this.statusInfo = 'Padding已达到最小值(0px)，无法继续减少'
    }
  }

  private resetPadding() {
    this.currentPadding = 10
    this.paddingInfo = `当前padding: ${this.currentPadding}px`
    this.statusInfo = 'Padding已重置为默认值10px'
    this.updateCursorInfo()
    console.log('Padding重置为10px')
  }

  private setLargePadding() {
    this.currentPadding = 50
    this.paddingInfo = `当前padding: ${this.currentPadding}px`
    this.statusInfo = '设置大padding(50px)进行极限测试，观察光标显示'
    this.updateCursorInfo()
    console.log('设置大padding为50px')
  }

  private updateCursorInfo() {
    try {
      const caretOffset = this.controller.getCaretOffset()
      this.cursorInfo = `光标偏移: ${caretOffset} | padding影响: ${this.currentPadding}px | 时间: ${new Date().toLocaleTimeString()}`
    } catch (error) {
      this.cursorInfo = `光标信息获取失败，当前padding: ${this.currentPadding}px`
      console.warn('获取光标信息失败:', error)
    }
  }
}
