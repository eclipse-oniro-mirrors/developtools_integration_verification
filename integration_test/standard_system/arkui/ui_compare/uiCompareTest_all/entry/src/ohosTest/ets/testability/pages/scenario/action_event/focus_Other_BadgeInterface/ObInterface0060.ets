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


class MyButtonBadgeController0060 extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    let buttonNode = typeNode.createNode(uiContext, 'Button');
    buttonNode.initialize('附加提示按钮')
      .width(120)
      .height(40);

    // 创建Badge组件
    let badgeNode = typeNode.createNode(uiContext, 'Badge');
    badgeNode.initialize({
      count: 10, // 设置count值为10
      style: {
        color: Color.Black, fontSize: 16, badgeSize: -20, badgeColor: Color.Pink
      }
    })

    // 将Badge附加到Button上
    badgeNode.appendChild(buttonNode);
    node.appendChild(badgeNode);

    return node;
  }
}

@Entry
@Component
struct ObInterface0060 {
  private controller = new MyButtonBadgeController0060();

  build() {
    Column() {
      NodeContainer(this.controller)
        .width('90%')
        .height(100)
        .margin(20)
    }
    .width('100%')
    .height('100%')
  }
}