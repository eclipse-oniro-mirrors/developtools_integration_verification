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
  private onContentScroll: ((totalOffsetX: number, totalOffsetY: number) => void) | null = null;
  private areaController: TextAreaController = new TextAreaController();
  private text: string = 'hello hello hello hello hello' ;

  setonContentScrolltCallback(callback: (totalOffsetX: number, totalOffsetY: number) => void) {
    this.onContentScroll = callback;
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
      .onContentScroll( (totalOffsetX: number, totalOffsetY: number) => {
        console.log('横坐标偏移为:' + totalOffsetX + ',纵坐标偏移为：' + totalOffsetY)
        this.onContentScroll?.(totalOffsetX,totalOffsetY);
      })
      .fontColor(Color.Black)
      .fontSize(16)
      .enterKeyType(EnterKeyType.Go)
      .id('UiComponentFrameNodeText06')
    col.appendChild(textArea);
    return node;
  }
}

@Entry
@Component
struct UiComponentFrameNodeText06 {
  private myNodeController: MyNodeController = new MyNodeController();
  @State text :string ='没触发submit回调'
  @State insertInfo:string='没触发onWillInsert回调'

  aboutToAppear() {
    this.myNodeController.setonContentScrolltCallback((offset, value) => {
      this.insertInfo = `横坐标偏移为：${offset}，纵坐标偏移为：${value || '空'}`;
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
