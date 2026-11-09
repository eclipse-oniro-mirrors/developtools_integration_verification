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
  private containerId: number = 0;
  onWillBind(): void { console.log('cmw myButton onWillBind'); }
  onBind(containerId: number): void { this.containerId = containerId; console.log('cmw myButton onBind:' + containerId); }
  makeNode(uiContext: UIContext): FrameNode | null {
    console.log('cmw myButton makeNode');
    let rootNode = new BuilderNode(uiContext, { surfaceId: '', type: NodeRenderType.RENDER_TYPE_DISPLAY });
    rootNode.build(wrapBuilder<[]>(buttonBuilder));
    return rootNode.getFrameNode();
  }
  onAttach(): void { console.log('cmw myButton onAttach'); }
  onDetach(): void { console.log('cmw myButton onDetach'); }
  aboutToDisappear(): void { console.log('cmw myButton aboutToDisappear'); }
  onWillUnbind(): void { console.log('cmw myButton onWillUnbind'); }
  onUnbind(): void { console.log('cmw myButton onUnbind:' + this.containerId); }
}

class MyTextController extends NodeController {
  private containerId: number = 0;
  onWillBind(): void { console.log('cmw myText onWillBind'); }
  onBind(containerId: number): void { this.containerId = containerId; console.log('cmw myText onBind:' + containerId); }
  makeNode(uiContext: UIContext): FrameNode | null {
    console.log('cmw myText makeNode');
    let rootNode = new BuilderNode(uiContext, { surfaceId: '', type: NodeRenderType.RENDER_TYPE_DISPLAY });
    rootNode.build(wrapBuilder<[]>(textBuilder));
    return rootNode.getFrameNode();
  }
  onAttach(): void { console.log('cmw myText onAttach'); }
  onDetach(): void { console.log('cmw myText onDetach'); }
  aboutToDisappear(): void { console.log('cmw myText aboutToDisappear'); }
  onWillUnbind(): void { console.log('cmw myText onWillUnbind'); }
  onUnbind(): void { console.log('cmw myText onUnbind:' + this.containerId); }
}

@Builder
function buttonBuilder() { Button('Button').width(150).height(40) }

@Builder
function textBuilder() { Text('Text').width(150).height(40) }

@Entry
@Component
struct NodecontrollerLifeCycle0140 {
  private myButtonController: MyButtonController = new MyButtonController();
  private myTextController: MyTextController = new MyTextController();

  aboutToAppear(): void { console.log('cmw NodecontrollerLifeCycle0140 aboutToAppear'); }
  aboutToDisappear(): void { console.log('cmw NodecontrollerLifeCycle0140 aboutToDisappear'); }

  build() {
    Column({ space: 20 }) {
      Text('生命周期测试 - 0140')
        .fontSize(20)
        .margin({ top: 20 })

      Text('应用关闭时观察控制台日志')
        .fontSize(14)

      Column({ space: 10 }) {
        NodeContainer(this.myButtonController).width(150).height(50)
        NodeContainer(this.myTextController).width(150).height(50)
      }
    }
    .width('100%')
    .height('100%')
  }
}