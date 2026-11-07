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

    let textTimer = typeNode.createNode(uiContext,'TextTimer')
    textTimer.initialize().fontColor(Color.Black).fontSize(50)
    col.appendChild(textTimer)

    let Badge_2 = typeNode.createNode(uiContext, 'Badge');
    Badge_2.initialize({
      count: 10,
      position: BadgePosition.Right,
      style: { badgeSize: 16, badgeColor: '#FA2A2D' }
    }).width(300).height(300)
    col.appendChild(Badge_2);
    let img_2 = typeNode.createNode(uiContext,'Image')
    img_2.initialize($r('app.media.icon')).width(24).height(24)
    Badge_2.appendChild(img_2)
    return node;
  }
}

@Entry
@Component
struct FrameNodeTypeTest27 {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Row() {
      NodeContainer(this.myNodeController);
    }
  }
}