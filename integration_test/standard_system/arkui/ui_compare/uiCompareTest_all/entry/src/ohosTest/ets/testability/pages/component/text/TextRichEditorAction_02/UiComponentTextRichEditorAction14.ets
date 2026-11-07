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

@Builder
function uiComponentTextRichEditorAction14Builder2() {
  Row({ space: 2 }) {
    Image($r('app.media.icon')).width(24).height(24).margin({ left: -5 })
    Text('okokokok').fontSize(10)
  }.width('20%').height('100%').padding(10).backgroundColor(Color.Red)
}

@Entry
@Component
struct UiComponentTextRichEditorAction14 {
  controller: RichEditorController = new RichEditorController();
  @State scrollInfo: string = '等待添加内容触发滚动'
  @State contentInfo: string = '内容数量: 0项'
  @State addCount: number = 0
  @State textCount: number = 0
  @State imageCount: number = 0
  @State symbolCount: number = 0
  @State builderCount: number = 0
  @State isScrolling: boolean = false
  private my_builder: CustomBuilder = undefined;
  @BuilderParam my_builder2:() => void = uiComponentTextRichEditorAction14Builder2;

  build() {
    Column() {
      Column({ space: 8 }) {
        Row({ space: 8 }) {
          Text(this.contentInfo)
            .fontSize(11)
            .fontColor(0x666666)
            .backgroundColor(0xF5F5F5)
            .padding(6)
            .fontStyle(FontStyle.Italic)
            .borderRadius(4)
            .flexGrow(1)
            .textAlign(TextAlign.Center)
        }
        .width('100%')
        Text(this.scrollInfo)
          .fontSize(11)
          .fontColor(Color.Orange)
          .backgroundColor(0xFFF3E0)
          .padding(6)
          .fontStyle(FontStyle.Italic)
          .border({ width: 1, color: Color.Orange, radius: 4 })
          .width('100%')
          .textAlign(TextAlign.Center)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('90%')
      .margin({ bottom: 15 })

      Column({ space: 10 }) {
        Row({ space: 10 }) {
          Button('添加文字')
            .fontSize(11)
            .height(35)
            .backgroundColor(0x2196F3)
            .fontColor(Color.White)
            .borderRadius(6)
            .flexGrow(1)
            .id('UiComponentTextRichEditorAction14_AddText')
            .onClick(() => {
              this.addTextSpan()
            })

          Button('添加图片')
            .fontSize(11)
            .height(35)
            .backgroundColor(0x9C27B0)
            .fontColor(Color.White)
            .borderRadius(6)
            .flexGrow(1)
            .id('UiComponentTextRichEditorAction14_AddImage')
            .onClick(() => {
              this.addImageSpan()
            })
        }
        .width('100%')

        Row({ space: 10 }) {
          Button('添加符号')
            .fontSize(11)
            .height(35)
            .backgroundColor(0x4CAF50)
            .fontColor(Color.White)
            .borderRadius(6)
            .flexGrow(1)
            .id('UiComponentTextRichEditorAction14_AddSymbol')
            .onClick(() => {
              this.addSymbolSpan()
            })

          Button('添加Builder')
            .fontSize(11)
            .height(35)
            .backgroundColor(0xFF9800)
            .fontColor(Color.White)
            .borderRadius(6)
            .flexGrow(1)
            .id('UiComponentTextRichEditorAction14_AddBuilder')
            .onClick(() => {
              this.addBuilderSpan()
            })
        }
        .width('100%')

        Row({ space: 10 }) {
          Button('批量添加5项')
            .fontSize(11)
            .height(35)
            .backgroundColor(0xFF5722)
            .fontColor(Color.White)
            .borderRadius(6)
            .flexGrow(1)
            .id('UiComponentTextRichEditorAction14_BatchAdd')
            .onClick(() => {
              this.batchAddContent()
            })
        }
        .width('100%')

        Button('builder3')
          .id('UiComponentTextRichEditorAction14_01')
          .onClick(() => {
          this.my_builder = () => {
            this.my_builder2()
          }
        })
      }
      .padding(15)
      .backgroundColor(0xF5F5F5)
      .borderRadius(8)
      .width('90%')
      .margin({ bottom: 15 })

      Column() {
        RichEditor({ controller: this.controller })
          .id('UiComponentTextRichEditorAction14_Editor')
          .onReady(() => {
            console.log('RichEditor已准备就绪')
          })
          .onFocus(() => {
            console.log('RichEditor获得焦点')
          })
          .onBlur(() => {
            console.log('RichEditor失去焦点')
          })
          .onSelect((value: RichEditorSelection) => {
            this.scrollInfo = `文本选中范围: [${value.selection[0]}, ${value.selection[1]}] | 总内容: ${this.addCount}项`
            console.log('文本选中:', value.selection)
          })
          .aboutToIMEInput((value: RichEditorInsertValue) => {
            this.scrollInfo = `即将输入: "${value.insertValue}" 位置: ${value.insertOffset}`
            console.log('即将输入:', value.insertValue)
            return true
          })
          .onIMEInputComplete((value: RichEditorTextSpanResult) => {
            this.scrollInfo = `用户输入完成: "${value.value}" | 内容可能触发滚动`
            this.updateContentInfo()
            console.log('用户输入完成:', value.value)
          })
          .placeholder('多次添加不同类型内容将触发组件内部滚动...', {
            fontColor: Color.Gray,
            font: {
              size: 14,
              weight: FontWeight.Normal,
              style: FontStyle.Normal
            }
          })
          .borderWidth(2)
          .borderColor(Color.Blue)
          .borderRadius(8)
          .width('100%')
          .height(200)
          .padding(10)
          .backgroundColor(Color.White)
      }
      .width('90%')
      .margin({ bottom: 15 })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .justifyContent(FlexAlign.Start)
    .backgroundColor(0xF9F9F9)
  }

  private addTextSpan() {
    this.textCount++
    this.addCount++
    const textContent = `这是第${this.textCount}段文字内容，用于测试RichEditor的滚动效果。添加时间：${new Date().toLocaleTimeString()}。`

    this.controller.addTextSpan(textContent, {
      style: {
        fontSize: 14 + (this.textCount % 4),
        fontWeight: this.textCount % 2 === 0 ? FontWeight.Bold : FontWeight.Normal
      }
    })

    this.updateContentInfo()
    this.scrollInfo = `文字添加成功，内容可能触发滚动效果`
    this.checkScrollState()
    console.log(`添加文字span: ${this.textCount}`)
  }

  private addImageSpan() {
    this.imageCount++
    this.addCount++

    this.controller.addImageSpan($r('app.media.icon'), {
      imageStyle: {
        size: [40 + (this.imageCount % 3) * 10, 40 + (this.imageCount % 3) * 10],
        verticalAlign: ImageSpanAlignment.CENTER,
        objectFit: ImageFit.Cover
      }
    })

    this.updateContentInfo()
    this.scrollInfo = `图片添加成功，尺寸：${40 + (this.imageCount % 3) * 10}px`
    this.checkScrollState()
    console.log(`添加图片span: ${this.imageCount}`)
  }

  private addSymbolSpan() {
    this.symbolCount++
    this.addCount++
    this.controller.addSymbolSpan($r('sys.symbol.ohos_trash'), {
      style: {
        fontSize: 16 + (this.symbolCount % 6)
      }
    })
    this.updateContentInfo()
    this.checkScrollState()
    console.log(`添加符号span: ${this.symbolCount}`)
  }


  private addBuilderSpan() {
    this.builderCount++
    this.addCount++
    let num = this.controller.addBuilderSpan(this.my_builder, { offset: undefined });
    this.updateContentInfo()
    this.scrollInfo = `Builder添加成功，自定义组件内容`
    this.checkScrollState()
    console.log(`添加Builder span: ${this.builderCount}`)
  }

  @Builder
  customBuilderContent() {
    Row({ space: 5 }) {
      Text(`[Builder${this.builderCount}]`)
        .fontSize(10)
        .fontColor(Color.White)
        .backgroundColor(0xFF5722)
        .padding({ left: 4, right: 4, top: 2, bottom: 2 })
        .borderRadius(3)

      Text(`自定义组件内容`)
        .fontSize(11)
        .fontColor(Color.Black)
        .backgroundColor(0xF3E5F5)
        .padding({ left: 6, right: 6, top: 2, bottom: 2 })
        .borderRadius(4)
    }
    .justifyContent(FlexAlign.Start)
  }

  private batchAddContent() {
    for (let i = 0; i < 5; i++) {
      setTimeout(() => {
        const type = i % 4
        switch (type) {
          case 0:
            this.addTextSpan()
            break
          case 1:
            this.addImageSpan()
            break
          case 2:
            this.addSymbolSpan()
            break
          case 3:
            this.addBuilderSpan()
            break
        }
      }, i * 200)
    }
    console.log('开始批量添加5项内容')
  }

  private updateContentInfo() {
    this.contentInfo = `内容数量: ${this.addCount}项 (文字:${this.textCount} 图片:${this.imageCount} 符号:${this.symbolCount} Builder:${this.builderCount})`
  }

  private checkScrollState() {
    if (this.addCount >= 8) {
      this.isScrolling = true
      this.scrollInfo = `内容已超过${this.addCount}项，组件内部滚动已触发`
    }
  }
}