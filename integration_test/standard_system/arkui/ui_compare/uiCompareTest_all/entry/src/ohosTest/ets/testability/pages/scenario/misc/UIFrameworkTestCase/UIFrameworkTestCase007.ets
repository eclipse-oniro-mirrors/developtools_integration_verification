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

import { RenderNode, FrameNode, NodeController } from '@ohos.arkui.node'

interface Rotation {
  x: number;
  y: number;
  z: number;
}

class RotatableNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private renderNode: RenderNode = new RenderNode();

  constructor(initialRotation:Rotation) {
    super();
    // 初始化RenderNode属性
    this.renderNode.backgroundColor = 0xffff0000;
    this.renderNode.frame = { x: 10, y: 10, width: 100, height: 100 };
    this.renderNode.rotation = initialRotation;
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    const rootRenderNode = this.rootNode.getRenderNode();
    rootRenderNode?.appendChild(this.renderNode);
    return this.rootNode;
  }

  // 新增旋转更新方法
  updateRotation(rotation:Rotation) {
    this.renderNode.rotation = rotation;
    this.rootNode?.invalidate(); // 触发节点更新
  }
}

@Entry
@Component
struct Index {
  private nodeController: RotatableNodeController = new RotatableNodeController({ x: 45, y: 0, z: 0 });
  @State currentRotation: Rotation = { x: 45, y: 0, z: 0 };

  build() {
    Column() {
      Text('This is a NodeContainer contains a text and a button ')
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .align(Alignment.Top)
        .margin({top:50})
      NodeContainer(this.nodeController)
        .width('60%')
        .height('60%')
        .align(Alignment.Center)

      Button('Set Rotation')
        .id('setRotation')
        .width(100)
        .height(100)
        .align(Alignment.Center)
        .onClick(() => {
          // 切换旋转角度
          const newRotation = this.currentRotation.x === 45 ?
            { x: 90, y: 0, z: 0 } as Rotation:
            { x: 45, y: 0, z: 0 } as Rotation;
          // 更新控制器和状态
          this.nodeController.updateRotation(newRotation);
          this.currentRotation = newRotation;
          // 打印日志
          console.info(`rootRender set rotation ${JSON.stringify(newRotation)} successfully`);
        })
    }
    .width('100%')
    .height('100%')
  }
}