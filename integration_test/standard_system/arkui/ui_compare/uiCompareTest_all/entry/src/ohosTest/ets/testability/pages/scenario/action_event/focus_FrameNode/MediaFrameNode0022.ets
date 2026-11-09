/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { NodeController, FrameNode, typeNode, } from '@kit.ArkUI';


class MyNodeController0022 extends NodeController {
  makeNode(uiContext: UIContext): FrameNode{
    let node = new FrameNode(uiContext);
    let Badge = typeNode.createNode(uiContext, 'Badge');
    Badge.initialize({
      value: 'New',
      position: BadgePosition.Right,
      style: { badgeSize: 16, badgeColor: '#FA2A2D' }
    })
    node.appendChild(Badge)
    let  TextArea = typeNode.createNode(uiContext, 'TextArea');
    TextArea.initialize({
      text:'文本框子组件',
    }) .fontColor(Color.Red).fontSize(16).width(60)
    Badge.appendChild(TextArea)
    return node;
  }
}

@Entry
@Component
struct MediaFrameNode0022 {
  private myNodeController: MyNodeController0022 = new MyNodeController0022();
  build() {
    Column() {
      NodeContainer(this.myNodeController);
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5');
  }

}