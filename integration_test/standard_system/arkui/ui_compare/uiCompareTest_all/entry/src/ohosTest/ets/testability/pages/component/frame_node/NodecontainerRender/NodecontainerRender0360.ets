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

import { RenderNode, FrameNode, NodeController } from '@kit.ArkUI';

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private renderNodes: RenderNode[] = [];

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    return this.rootNode;
  }

  addRenderNode(): void {
    if (this.rootNode) {
      let renderNode = new RenderNode();
      renderNode.frame = { x: 0, y: 0, width: 100, height: 50 };
      renderNode.backgroundColor = 0xFF00FF00;
      this.rootNode.getRenderNode()?.appendChild(renderNode);
      this.renderNodes.push(renderNode);
    }
  }

  getRenderNodeChild(index: number): RenderNode | null {
    if (this.rootNode) {
      let rootRenderNode = this.rootNode.getRenderNode();
      if (rootRenderNode) {
        return rootRenderNode.getChild(index);
      }
    }
    return null;
  }

  getRenderNodeCount(): number {
    return this.renderNodes.length;
  }
}

@Entry
@Component
struct NodecontainerRender0360 {
  @State index: number = 0
  @State logText: string = ''
  private nodeController: MyNodeController = new MyNodeController()

  build() {
    Column() {
      Text('NodecontainerRender0360')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('nodecontainer_render_0360_title')

      // 显示当前index
      Text(`当前index: ${this.index}`)
        .fontSize(16)
        .margin({ bottom: 15 })
        .id('text_current_index_0360')

      // 步骤1：点击renderNode补充按钮
      Button('renderNode补充')
        .id('button_render_node_0360')
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .onClick(() => {
          this.nodeController.addRenderNode()
          console.log('sally: renderNode added successfully')
        })

      // 步骤2：点击Test++按钮，直至index变为5
      Button('Test++')
        .id('button_test_plus_0360')
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .onClick(() => {
          this.index++
          console.log(`sally: index increased to ${this.index}`)
        })

      // 步骤3：点击getChild按钮
      Button('getChild')
        .id('button_get_child_0360')
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .onClick(() => {
          let child = this.nodeController.getRenderNodeChild(this.index)
          if (child === null) {
            console.log(`sally: getChild(${this.index}) successfully and and the child is null`)
            this.logText = `getChild(${this.index}) successfully and and the child is null`
          } else {
            console.log(`sally: getChild(${this.index}) successfully and the child exists`)
            this.logText = `getChild(${this.index}) successfully and the child exists`
          }
        })

      // NodeContainer
      NodeContainer(this.nodeController)
        .id('node_container_0360')
        .width('80%')
        .height(200)
        .backgroundColor('#E0E0E0')
        .margin({ bottom: 15 })

      // 显示日志结果
      Text(this.logText)
        .fontSize(14)
        .fontColor(Color.Green)
        .margin({ bottom: 15 })
        .id('text_log_result_0360')
        .textAlign(TextAlign.Center)
        .width('90%')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ top: 20 })
  }
}
