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

  setonWillInsertCallback(callback: (offset: number, value: string) => void) {
    this.onWillInsert = callback;
  }
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute.width(100)
      .height(100)
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
    textArea.initialize({text: this.text,
      placeholder: 'The text area can hold an unlimited amount of text. input your word...',
      controller: this.areaController})
      .onWillInsert((info: InsertValue) => {
        this.insertOffset = info.insertOffset
        this.insertValue= info.insertValue
        this.onWillInsert?.(this.insertOffset, this.insertValue);
        return true;
      })
      .fontColor(Color.Black)
      .fontSize(16)
      .enterKeyType(EnterKeyType.Go)
      .id('UiComponentFrameNodeText05')
    col.appendChild(textArea);
    return node;
  }
}

@Entry
@Component
struct UiComponentFrameNodeText05 {
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
        Text('FrameNode set textarea onWillInsert')
          .fontSize(15)
          .fontColor(Color.Red)
          .fontWeight(FontWeight.Bolder)
          .width('90%')
          .lineHeight(20)
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
      }
      .width('100%')
      .height('8.2%')
      NodeContainer(this.myNodeController);
    }
  }
}
