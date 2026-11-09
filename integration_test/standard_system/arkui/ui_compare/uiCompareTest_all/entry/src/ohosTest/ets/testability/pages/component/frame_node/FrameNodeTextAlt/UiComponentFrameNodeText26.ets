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
type InputFilter = [
  value: ResourceStr,
  error?: (value: string) => void
];
class MyNodeController extends NodeController {
  onCreateMenu = (menuItems: TextMenuItem[]) => {
    let item1: TextMenuItem = {
      content: 'custom1',
      icon: $r('app.media.icon'),
      id: TextMenuItemId.of('custom1'),
    };
    let item2: TextMenuItem = {
      content: 'custom2',
      id: TextMenuItemId.of('custom2'),
      icon: $r('app.media.icon'),
    };
    menuItems.push(item1)
    menuItems.unshift(item2)
    return menuItems
  };
  private onWillInsert: ((offset: number, value: string) => void) | null = null;
  private areaController: TextAreaController = new TextAreaController();
  private text: string = '123456789' ;
  private insertOffset: number = 0 ;
  private insertValue: string = '' ;
  private placeholderColor: ResourceColor = Color.Green;
  private lineBreakStrategy: LineBreakStrategy = LineBreakStrategy.GREEDY;
  private textOverflow: TextOverflow = TextOverflow.None;
  private textContentStyle: TextContentStyle = TextContentStyle.DEFAULT;
  private textalign: TextAlign = TextAlign.Start;
  private wordBreak: WordBreak = WordBreak.NORMAL;
  private selectedcolor: ResourceColor = Color.Green;
  private letterSpacing: number | string | Resource =3;
  private enterKeyType: EnterKeyType =EnterKeyType.Next;
  private textIndent: Dimension ='10px';
  private lineHeight: number | string | Resource =20;
  private barState: BarState =BarState.Off;
  private textAreaType: TextAreaType =TextAreaType.NORMAL;

  setonWillInsertCallback(callback: (offset: number, value: string) => void) {
    this.onWillInsert = callback;
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute
      .width(300)
      .height(200)
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
      text: this.text,
      placeholder: 'The text area can hold an unlimited amount of text. input your word...',
      controller: this.areaController
    })
      .onWillInsert((info: InsertValue) => {
        this.insertOffset = info.insertOffset
        this.insertValue = info.insertValue
        this.onWillInsert?.(this.insertOffset, this.insertValue);
        return true;
      })
      .editMenuOptions({
        onCreateMenu: this.onCreateMenu, onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
          if (menuItem.id.equals(TextMenuItemId.of('custom2'))) {
            console.log('拦截 id: custom2 start:' + textRange.start + '; end:' + textRange.end)
            return true;
          }
          if (menuItem.id.equals(TextMenuItemId.COPY)) {
            console.log('拦截 COPY start:' + textRange.start + '; end:' + textRange.end)
            return true;
          }
          if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
            console.log('不拦截 SELECT_ALL start:' + textRange.start + '; end:' + textRange.end)
            return false;
          }
          return false;
        }
      })
      .fontFeature('"ss01" on')
      .selectionMenuHidden(false)
      .letterSpacing(this.letterSpacing)
      .decoration({
        type: TextDecorationType.None,
        color: Color.Red,
      })
      .type(this.textAreaType)
      .barState(this.barState)
      .lineHeight(this.lineHeight)
      .textIndent(this.textIndent)
      .enterKeyType(this.enterKeyType)
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
      .id('UiComponentFrameNodeText26_01')

    col.appendChild(textArea);
    return node;
  }
}

@Entry
@Component
struct UiComponentFrameNodeText26 {
  private myNodeController: MyNodeController = new MyNodeController();
  @State text :string ='没触发submit回调'
  @State insertInfo:string='没触发onWillInsert回调'

  aboutToAppear() {
    this.myNodeController.setonWillInsertCallback((offset, value) => {
      this.insertInfo = `插入位置：${offset}，插入内容：${value || '空'}`;
    });
  }

  build() {
    Column() {
      Row(){
        Text('FrameNode set textarea fontFeature to ss01')
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

      NodeContainer(this.myNodeController);
    }
  }
}
