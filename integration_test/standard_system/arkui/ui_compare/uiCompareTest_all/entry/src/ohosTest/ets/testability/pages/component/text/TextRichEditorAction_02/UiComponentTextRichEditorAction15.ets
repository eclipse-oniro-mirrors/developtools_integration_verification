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
struct UiComponentTextRichEditorAction15 {
  controller: RichEditorController = new RichEditorController();

  @State cursorInfo: string = '光标位置: 未获取'
  @State insertCount: number = 0
  @State textCount: number = 0
  @State imageCount: number = 0

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0120')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Red)
        .fontStyle(FontStyle.Italic)
        .textAlign(TextAlign.Center)
        .margin({
          top: 10,
          left: 20 ,
          right:20,
          bottom:10
        })

      Text(this.cursorInfo)
        .fontSize(14)
        .fontColor(Color.Blue)
        .fontStyle(FontStyle.Italic)
        .backgroundColor(0xE3F2FD)
        .padding(10)
        .borderRadius(8)
        .width('90%')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 15 })

      Row({ space: 15 }) {
        Button('插入文字')
          .fontSize(14)
          .height(40)
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 2,
            minFontSize: 10,
            maxFontSize: 20,
            font: {
              size: 20,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .backgroundColor(0x2196F3)
          .fontColor(Color.White)
          .borderRadius(8)
          .flexGrow(1)
          .id('UiComponentTextRichEditorAction15_InsertText')
          .onClick(() => {
            this.insertText()
          })

        Button('插入图片')
          .fontSize(14)
          .height(40)
          .backgroundColor(0x4CAF50)
          .fontColor(Color.White)
          .borderRadius(8)
          .flexGrow(1)
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 2,
            minFontSize: 10,
            maxFontSize: 20,
            font: {
              size: 20,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .id('UiComponentTextRichEditorAction15_InsertImage')
          .onClick(() => {
            this.insertImage()
          })
      }
      .width('90%')
      .margin({ bottom: 15 })

      RichEditor({ controller: this.controller })
        .id('UiComponentTextRichEditorAction15_Editor')
        .onReady(() => {
          this.controller.addSymbolSpan($r('sys.symbol.ohos_trash'),
            {
              style:
              {
                fontSize: 30
              }
            })
          this.controller.addImageSpan(('/icon.png'),
            {
              imageStyle:
              {
                size: ['57px', '57px']
              }
            })
          this.controller.addTextSpan('25',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30
              }
            })
        })
        .onFocus(() => {
          console.log('RichEditor获得焦点')
        })
        .onBlur(() => {
          this.cursorInfo = '编辑器失去焦点'
          console.log('RichEditor失去焦点')
        })
        .onSelect((value: RichEditorSelection) => {
          this.cursorInfo = `选中范围: [${value.selection[0]}, ${value.selection[1]}]`
          console.log('文本选中:', value.selection)
        })
        .aboutToIMEInput((value: RichEditorInsertValue) => {
          this.cursorInfo = `即将输入: "${value.insertValue}" 位置: ${value.insertOffset}`
          console.log('即将输入:', value.insertValue)
          return true
        })
        .onIMEInputComplete((value: RichEditorTextSpanResult) => {
          this.cursorInfo = `输入完成: "${value.value}"`
          console.log('输入完成:', value.value)
        })
        .placeholder('点击按钮插入图片和文字测试光标位置', {
          fontColor: Color.Gray,
          font: { size: 16 }
        })
        .borderWidth(2)
        .borderColor(Color.Blue)
        .borderRadius(8)
        .width('90%')
        .height(300)
        .padding(15)
        .backgroundColor(Color.White)
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
    .backgroundColor(0xF5F5F5)
  }

  private insertText() {
    this.textCount++
    this.insertCount++
    const textContent = `文字${this.textCount} `
    this.controller.addTextSpan(textContent, {
      style: {
        fontColor: Color.Black,
        fontSize: 16,
        fontWeight: FontWeight.Normal
      }
    })
    console.log(`插入文字: ${textContent}`)
  }

  private insertImage() {
    this.imageCount++
    this.insertCount++
    this.controller.addImageSpan(('/icon.png'), {
      imageStyle: {
        size: [40, 40],
        verticalAlign: ImageSpanAlignment.CENTER,
        objectFit: ImageFit.Cover
      }
    })
    console.log(`插入图片: ${this.imageCount}`)
  }
}
