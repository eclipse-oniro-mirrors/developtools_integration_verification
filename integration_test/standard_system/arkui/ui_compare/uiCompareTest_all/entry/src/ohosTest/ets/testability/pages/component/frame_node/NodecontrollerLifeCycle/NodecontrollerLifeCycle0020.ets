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

import { NodeController, BuilderNode, NodeRenderType, FrameNode } from '@kit.ArkUI'

class MyButtonController extends NodeController {
  onWillBind(): void { console.log('Cmw myButton onWillBind'); }
  onBind(containerId: number): void { console.log('Cmw myButton onBind:' + containerId); }
  makeNode(uiContext: UIContext): FrameNode | null {
    console.log('Cmw myButton makeNode');
    let rootNode = new BuilderNode(uiContext, { surfaceId: '', type: NodeRenderType.RENDER_TYPE_DISPLAY });
    rootNode.build(wrapBuilder<[]>(buttonBuilder));
    return rootNode.getFrameNode();
  }
}

class MyTextController extends NodeController {
  onWillBind(): void { console.log('Cmw myText onWillBind'); }
  onBind(containerId: number): void { console.log('Cmw myText onBind:' + containerId); }
  makeNode(uiContext: UIContext): FrameNode | null {
    console.log('Cmw myText makeNode');
    let rootNode = new BuilderNode(uiContext, { surfaceId: '', type: NodeRenderType.RENDER_TYPE_DISPLAY });
    rootNode.build(wrapBuilder<[]>(textBuilder));
    return rootNode.getFrameNode();
  }
}

@Builder
function buttonBuilder() { Button('Button').width(150).height(40) }

@Builder
function textBuilder() { Text('Text').width(150).height(40) }

@Entry
@Component
struct NodecontrollerLifeCycle0020 {
  @State showNodes: boolean = false;
  private myButtonController: MyButtonController = new MyButtonController();
  private myTextController: MyTextController = new MyTextController();

  build() {
    Column({ space: 20 }) {
      Text('生命周期测试 - 0020')
        .fontSize(20)
        .margin({ top: 20 })

      Button('触发绑定')
        .id('trigger_button_lifecycle_0020')
        .onClick(() => { this.showNodes = true; })

      if (this.showNodes) {
        Column({ space: 10 }) {
          NodeContainer(this.myButtonController).width(150).height(50)
          NodeContainer(this.myTextController).width(150).height(50)
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}