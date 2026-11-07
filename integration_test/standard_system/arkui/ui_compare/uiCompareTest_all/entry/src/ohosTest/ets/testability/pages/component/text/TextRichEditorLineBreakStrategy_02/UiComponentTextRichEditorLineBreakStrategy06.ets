/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
struct UiComponentTextRichEditorLineBreakStrategy06 {
  private controller: RichEditorController = new RichEditorController();
  private options: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0014')
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)
          .fontColor('#007DFF')
          .letterSpacing(0.3)
          .textAlign(TextAlign.Center)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Text('Level 3 测试用例')
          .fontSize(9)
          .fontStyle(FontStyle.Italic)
          .fontColor('#99182431')
          .letterSpacing(0.2)
          .textAlign(TextAlign.Center)
          .margin({ top: 2 })
          .opacity(0.8)
      }
      .width('100%')
      .padding({ top: 5, bottom: 5, left: 8, right: 8 })
      .backgroundColor('#E6F2FD')
      .borderRadius(4)
      .margin({ top: 4, bottom: 3 })
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .shadow({
        radius: 1,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 1
      })

      Column({ space: 3 }) {
        Text('测试配置')
          .fontSize(10)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Medium)
          .fontColor('#E65100')
          .letterSpacing(0.3)
          .alignSelf(ItemAlign.Start)
          .margin({ bottom: 1 })

        Text('组件: RichEditor富文本编辑器')
          .fontSize(9)
          .fontStyle(FontStyle.Italic)
          .fontColor('#66182431')
          .letterSpacing(0.1)
          .lineHeight(12)
          .alignSelf(ItemAlign.Start)
          .opacity(0.9)

        Text('lineBreakStrategy: BALANCED')
          .fontSize(9)
          .fontStyle(FontStyle.Italic)
          .fontColor('#E84026')
          .fontWeight(FontWeight.Medium)
          .letterSpacing(0.1)
          .lineHeight(12)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('内容类型: Non-CJK文本 + CJK文本 + 图片 + Symbol + 表情 + 数字 + 特殊符号')
          .fontSize(9)
          .fontStyle(FontStyle.Italic)
          .fontColor('#66182431')
          .letterSpacing(0.1)
          .lineHeight(12)
          .alignSelf(ItemAlign.Start)
          .opacity(0.9)

        Text('测试类型: 动态输入文本，观察折行效果')
          .fontSize(9)
          .fontStyle(FontStyle.Italic)
          .fontColor('#66182431')
          .letterSpacing(0.1)
          .lineHeight(12)
          .alignSelf(ItemAlign.Start)
          .opacity(0.85)
      }
      .width('90%')
      .padding({ top: 6, bottom: 6, left: 8, right: 8 })
      .backgroundColor('#FFF5F0')
      .borderRadius(4)
      .alignItems(HorizontalAlign.Start)
      .margin({ top: 4, bottom: 3 })
      .border({
        width: 1,
        color: '#FFE0B2',
        style: BorderStyle.Solid
      })
      .shadow({
        radius: 2,
        color: '#0D000000',
        offsetX: 0,
        offsetY: 1
      })

      Column({ space: 3 }) {
        Text('预期效果')
          .fontSize(10)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2E7D32')
          .letterSpacing(0.3)
          .alignSelf(ItemAlign.Start)
          .margin({ bottom: 2 })

        Text('✓ RichEditor组件可以正常显示')
          .fontSize(9)
          .fontColor('#388E3C')
          .letterSpacing(0.1)
          .lineHeight(13)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('✓ 显示混合内容（中英文、图片、Symbol、表情等）')
          .fontSize(9)
          .fontColor('#388E3C')
          .letterSpacing(0.1)
          .lineHeight(13)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('✓ 点击按钮动态输入文本')
          .fontSize(9)
          .fontColor('#388E3C')
          .letterSpacing(0.1)
          .lineHeight(13)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('✓ 输入内容跟随段落的折行效果')
          .fontSize(9)
          .fontColor('#388E3C')
          .letterSpacing(0.1)
          .lineHeight(13)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)
      }
      .width('90%')
      .padding({ top: 6, bottom: 6, left: 8, right: 8 })
      .backgroundColor('#E8F5E9')
      .borderRadius(4)
      .alignItems(HorizontalAlign.Start)
      .margin({ top: 6, bottom: 4 })
      .border({
        width: 1,
        color: '#C8E6C9',
        style: BorderStyle.Solid
      })
      .shadow({
        radius: 2,
        color: '#0D000000',
        offsetX: 0,
        offsetY: 1
      })

      Divider()
        .strokeWidth(1)
        .color('#0A182431')
        .margin({ top: 3, bottom: 3 })
        .vertical(false)
        .lineCap(LineCapStyle.Round)

      Column({ space: 3 }) {
        Button('动态输入 hello world')
          .fontSize(10)
          .id('UiComponentTextRichEditorLineBreakStrategy06')
          .fontColor(Color.White)
          .backgroundColor('#007DFF')
          .width(200)
          .height(35)
          .borderRadius(6)
          .type(ButtonType.Normal)
          .stateEffect(true)
          .enabled(true)
          .fontWeight(FontWeight.Medium)
          .onClick(() => {
            this.controller.addTextSpan('hello world', {
              style: {
                fontSize: 16,
                fontColor: '#182431'
              },
              paragraphStyle: {
                lineBreakStrategy: LineBreakStrategy.BALANCED
              }
            });
            console.info('动态添加文本: hello');
          })
          .margin({ top: 5, bottom: 5 })

        RichEditor(this.options)
          .id('RichEditorLineBreakStrategy06')
          .onReady(() => {
            this.controller.addTextSpan('Hello World ABCDEFG ', {
              style: {
                fontSize: 16,
                fontColor: '#182431'
              },
              paragraphStyle: {
                lineBreakStrategy: LineBreakStrategy.BALANCED
              }
            });

            this.controller.addTextSpan('这是中文内容测试 ', {
              style: {
                fontSize: 16,
                fontColor: '#182431'
              },
              paragraphStyle: {
                lineBreakStrategy: LineBreakStrategy.BALANCED
              }
            });

            this.controller.addImageSpan($r('app.media.icon'), {
              imageStyle: {
                size: ['100px', '100px']
              }
            });

            this.controller.addTextSpan(' ', {
              paragraphStyle: {
                lineBreakStrategy: LineBreakStrategy.BALANCED
              }
            });

            this.controller.addTextSpan('1234567890 !@#$%^&*() ', {
              style: {
                fontSize: 16,
                fontColor: '#182431'
              },
              paragraphStyle: {
                lineBreakStrategy: LineBreakStrategy.BALANCED
              }
            });

            this.controller.addSymbolSpan($r('sys.symbol.ohos_trash'), {
              style: {
                fontSize: 20
              }
            });

            this.controller.addTextSpan(' ', {
              paragraphStyle: {
                lineBreakStrategy: LineBreakStrategy.BALANCED
              }
            });

            this.controller.addTextSpan('English Text 日本語 한국어 ', {
              style: {
                fontSize: 16,
                fontColor: '#182431'
              },
              paragraphStyle: {
                lineBreakStrategy: LineBreakStrategy.BALANCED
              }
            });

            this.controller.addSymbolSpan($r('sys.symbol.ohos_star'), {
              style: {
                fontSize: 20
              }
            });

            this.controller.addTextSpan(' ', {
              paragraphStyle: {
                lineBreakStrategy: LineBreakStrategy.BALANCED
              }
            });

            this.controller.addTextSpan('😀😃😄 😊😋😎 🎉🎊🎈 ', {
              style: {
                fontSize: 16,
                fontColor: '#182431'
              },
              paragraphStyle: {
                lineBreakStrategy: LineBreakStrategy.BALANCED
              }
            });

            this.controller.addTextSpan('Mixed Content: 混合内容 123 ABC 日本語 한국어 ', {
              style: {
                fontSize: 16,
                fontColor: '#182431'
              },
              paragraphStyle: {
                lineBreakStrategy: LineBreakStrategy.BALANCED
              }
            });

            this.controller.updateParagraphStyle({
              start: 0,
              end: -1,
              style: {
                lineBreakStrategy: LineBreakStrategy.BALANCED
              }
            });
          })
          .width(300)
          .height(400)
          .borderWidth(1)
          .borderColor('#CCCCCC')
          .borderRadius(4)
          .padding(8)
          .margin({ top: 5, bottom: 10 })
      }
      .width('100%')
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .padding({ top: 6, bottom: 6 })
    }
    .width('100%')
    .height('100%')
    .padding({ left: 6, right: 6, top: 3, bottom: 3 })
    .backgroundColor('#F5F5F5')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Start)
  }
}

