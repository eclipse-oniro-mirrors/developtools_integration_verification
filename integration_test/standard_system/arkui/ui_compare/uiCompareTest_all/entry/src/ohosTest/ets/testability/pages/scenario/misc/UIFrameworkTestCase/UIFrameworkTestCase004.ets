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
import { UIContext } from '@ohos.arkui.UIContext';

const renderNode = new RenderNode();
const renderNode1 = new RenderNode();

// 初始化第一个RenderNode的阴影属性
renderNode.backgroundColor = 0xffff0000;
renderNode.frame = { x: 0, y: 0, width: 100, height: 100 };
renderNode.shadowOffset = { x: 10, y: 10 };
renderNode.shadowAlpha = 0.7
renderNode.shadowElevation = 30; // 满足第一个测试点

// 初始化第二个RenderNode的阴影属性
renderNode1.backgroundColor = 0xff00ff00;
renderNode1.frame = { x: 0, y: 0, width: 100, height: 100 };
renderNode1.shadowElevation = 0; // 初始无阴影

class BaseNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    throw new Error('Method not implemented.');
  }
  protected rootNode: FrameNode | null = null; // 统一属性名
  // 公共初始化方法
  protected initRenderNode(node: RenderNode) {
    node.shadowOffset = { x: 10, y: 10 };
    node.shadowAlpha = 0.7;
  }
}

class ShadowNodeController extends BaseNodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    const rootRenderNode = this.rootNode.getRenderNode();
    if (rootRenderNode) {
      this.initRenderNode(renderNode);
      rootRenderNode.appendChild(renderNode);
    }
    return this.rootNode;
  }
}

class NormalNodeController extends BaseNodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    const rootRenderNode = this.rootNode.getRenderNode();
    if (rootRenderNode) {
      this.initRenderNode(renderNode1);
      renderNode1.shadowElevation = 0; // ✅ 明确设置无阴影
      rootRenderNode.appendChild(renderNode1);
    }
    return this.rootNode;
  }
}

@Entry
@Component
struct Index {
  private shadowController: ShadowNodeController = new ShadowNodeController();
  private normalController: NormalNodeController = new NormalNodeController();
  @State setShadow: boolean = false;

  build() {
    Column() {
      Text('This is a NodeContainer contains a text and a button ')
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .align(Alignment.Top)
        .margin({top:50})
      NodeContainer(this.setShadow ? this.shadowController : this.normalController)
        .width('60%')
        .height('60%')
        .align(Alignment.Center)
      Button('Toggle Shadow')
        .id('setShadow')
        .width(100)
        .height(100)
        .align(Alignment.Center)
        .onClick(() => {
          this.setShadow = !this.setShadow;
          if (this.setShadow) {
            renderNode.shadowElevation = 30;
            console.info('rootRender set shadowElevation = 30 successfully');
          } else {
            renderNode1.shadowElevation = 0;
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}