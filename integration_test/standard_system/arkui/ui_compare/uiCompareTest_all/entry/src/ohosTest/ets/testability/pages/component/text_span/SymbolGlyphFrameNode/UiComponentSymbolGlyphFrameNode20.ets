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
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute.width(100)
      .height(50)
      .borderColor(Color.Gray)
      .borderWidth(1)
      .margin({ left: 10 });
    let col = typeNode.createNode(uiContext, 'Column');
    col.initialize({ space: 5 })
      .width('100%').height('100%').margin({ top: 5 });
    node.appendChild(col);
    let text = typeNode.createNode(uiContext, 'SymbolGlyph');
    text.initialize($r('sys.symbol.ohos_trash'))
      .fontColor(undefined)
    col.appendChild(text);
    return node;
  }
}

class MyNodeController2 extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute.width(100)
      .height(50)
      .borderColor(Color.Gray)
      .borderWidth(1)
      .margin({ left: 10 });
    let col = typeNode.createNode(uiContext, 'Column');
    col.initialize({ space: 5 })
      .width('100%').height('100%').margin({ top: 5 });
    node.appendChild(col);
    let text = typeNode.createNode(uiContext, 'SymbolGlyph');
    text.initialize($r('sys.symbol.ohos_trash'))
    col.appendChild(text);
    return node;
  }
}

@Entry
@Component
struct UiComponentSymbolGlyphFrameNode20 {
  private myNodeController: MyNodeController = new MyNodeController();
  private myNodeController2: MyNodeController = new MyNodeController2();
  @State text :string ='SymbolGlyph set fontColor to undefined'
  @State text2 :string ='normal SymbolGlyph'

  build() {
    Column() {
      Row(){
        Text(this.text)
          .fontSize(15)
          .fontColor(0xCCCCCC)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .margin(30)
          .padding(10)
          .fontColor(Color.Black)
          .fontStyle(FontStyle.Italic)
          .height(100)
      }
      .width('100%')
      NodeContainer(this.myNodeController);
      Row(){
        Text(this.text2)
          .fontSize(15)
          .fontColor(0xCCCCCC)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .margin(30)
          .padding(10)
          .fontColor(Color.Black)
          .fontStyle(FontStyle.Italic)
          .height(100)
      }
      .width('100%')
      NodeContainer(this.myNodeController2);
    }
  }
}
