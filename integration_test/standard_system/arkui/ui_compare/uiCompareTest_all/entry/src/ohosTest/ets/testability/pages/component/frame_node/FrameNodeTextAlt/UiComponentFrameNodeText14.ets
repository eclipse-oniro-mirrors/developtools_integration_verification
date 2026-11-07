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

import { NodeController, FrameNode, typeNode } from '@kit.ArkUI';

class MyNodeController extends NodeController {
  private onWillInsert: ((offset: number, value: string) => void) | null = null;
  private areaController: TextAreaController = new TextAreaController();
  private text: string = '' ;
  private insertOffset: number = 0 ;
  private insertValue: string = '' ;
  private placeholderColor: ResourceColor = Color.Green;
  private lineBreakStrategy: LineBreakStrategy = LineBreakStrategy.GREEDY;
  private textOverflow: TextOverflow = TextOverflow.None;
  private textContentStyle: TextContentStyle = TextContentStyle.DEFAULT;
  private textalign: TextAlign = TextAlign.Start;
  private wordBreak: WordBreak = WordBreak.NORMAL;
  private selectedcolor: ResourceColor = Color.Green;
  private decoration: TextDecorationStyle = TextDecorationStyle.SOLID;
  private message1: string =
    'They can be classified as built-in components–those directly provided by the ArkUI framework and custom components – those defined by developers' +
      'The built-in components include buttons radio buttonsprogress indicators and text You can set the rendering effectof thesecomponents in method ' +
      'chaining mode,page components are divided into independent UI units to implementindependent'
      +'creation development and reuse of different units on pages making pages more engineering-oriented.';

  setdecoration(decoration: TextDecorationStyle) {
    this.decoration = decoration;
    this.rebuild();
  }

  setonWillInsertCallback(callback: (offset: number, value: string) => void) {
    this.onWillInsert = callback;
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute
      .width(300)
      .height(300)
      .borderColor(Color.Gray)
      .borderWidth(1)
      .margin({ left: 10 });

    let col = typeNode.createNode(uiContext, 'Column');
    col.initialize({ space: 5 })
      .width('100%')
      .height('100%')
      .margin({ top: 5 });
    node.appendChild(col);

    let textArea = typeNode.createNode(uiContext, 'TextArea')
    textArea.initialize({
      text: this.message1,
      placeholder: 'The text area can hold an unlimited amount of text. input your word...',
      controller: this.areaController
    })
      .onWillInsert((info: InsertValue) => {
        this.insertOffset = info.insertOffset
        this.insertValue = info.insertValue
        this.onWillInsert?.(this.insertOffset, this.insertValue);
        return true;
      })
      .decoration({
        type: TextDecorationType.LineThrough,
        color: Color.Red,
        style: this.decoration
      })
      .selectedBackgroundColor(this.selectedcolor)
      .wordBreak(this.wordBreak)
      .textAlign(this.textalign)
      .style(this.textContentStyle)
      .textOverflow(this.textOverflow)
      .placeholderColor(this.placeholderColor)
      .lineBreakStrategy(this.lineBreakStrategy)
      .fontColor(Color.Black)
      .fontSize(16)
      .enterKeyType(EnterKeyType.Go)
      .id('UiComponentFrameNodeText14_01')

    col.appendChild(textArea);
    return node;
  }
}

@Entry
@Component
struct UiComponentFrameNodeText14 {
  private myNodeController: MyNodeController = new MyNodeController();
  @State text :string ='没触发submit回调'
  @State insertInfo:string='没触发onWillInsert回调'
  private colors: ResourceColor[] = [Color.Green, 0xff0000, '#ff00ff',$r('app.color.ColorRed')];
  private currentIndex: number = 0;
  private selectedcolor: ResourceColor[] = [Color.Green, 0xff0000, '#ff00ff',$r('app.color.ColorRed')];
  private decoration: TextDecorationStyle[] = [TextDecorationStyle.SOLID,TextDecorationStyle.DOUBLE,TextDecorationStyle.DOTTED,
    TextDecorationStyle.DASHED,TextDecorationStyle.WAVY];

  aboutToAppear() {
    this.myNodeController.setonWillInsertCallback((offset, value) => {
      this.insertInfo = `插入位置：${offset}，插入内容：${value || '空'}`;
    });
  }

  private changeselectedcolor() {
    this.currentIndex = (this.currentIndex + 1) % this.decoration.length;
    this.myNodeController.setdecoration(this.decoration[this.currentIndex]);
  }

  build() {
    Column() {
      Row(){
        Text('FrameNode set textarea decoration')
          .fontSize(15)
          .fontColor(Color.Red)
          .fontWeight(FontWeight.Bolder)
          .width('90%')
          .lineHeight(20)
          .margin({
            left: 6,
            right: 6,
            bottom:30,
            top:10
          })
      }

      Row(){
        Text(this.insertInfo)
          .fontSize(15)
          .width('90%')
          .lineHeight(20)
          .margin(30)
          .padding(10)
          .fontColor(Color.Black)
          .fontStyle(FontStyle.Italic)
          .margin({
            left: 6,
            right: 6,
            bottom:30,
            top:10
          })
      }
      .width('100%')
      .height('8.2%')

      Button('切换decoration')
        .fontSize(10)
        .height(100)
        .backgroundColor(0x317aff)
        .width('90%')
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
        .id('UiComponentFrameNodeText14_02')
        .padding({
          left: 15,
          right: 15
        })
        .margin({ bottom: 10 })
        .onClick(
          () => this.changeselectedcolor()
        )
      NodeContainer(this.myNodeController);
    }
  }
}
