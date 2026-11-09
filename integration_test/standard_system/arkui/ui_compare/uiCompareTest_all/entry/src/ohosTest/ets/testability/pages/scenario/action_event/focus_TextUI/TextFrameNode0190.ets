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
import { NodeController, FrameNode, typeNode } from '@kit.ArkUI';

class MyNodeController0190 extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let areacontroller: TextAreaController = new TextAreaController();
    let node = new FrameNode(uiContext)
    node.commonAttribute.width(100)
      .height(50)
      .borderColor(Color.Gray)
      .borderWidth(1)
      .margin({ left: 10 });
    let textArea = typeNode.createNode(uiContext, 'TextArea')
    textArea.initialize({text: 'textArea调测文本',
      placeholder: 'The text area can hold an unlimited amount of text. input your word...',
      controller: areacontroller})
      .selectionMenuHidden(true)
    node.appendChild(textArea);
    return node;
  }
}

@Entry
@Component
struct FrameNodeTypeTest0190 {
  private myNodeController: MyNodeController0190 = new MyNodeController0190();

  build() {
    Row() {
      NodeContainer(this.myNodeController);
    }
  }
}