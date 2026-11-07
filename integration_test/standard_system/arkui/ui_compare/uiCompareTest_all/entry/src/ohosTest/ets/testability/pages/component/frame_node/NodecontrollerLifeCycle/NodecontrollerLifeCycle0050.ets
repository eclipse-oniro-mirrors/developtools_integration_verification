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
  onWillBind(): void { console.log('Cmw myButton onWillBind'); }
  onBind(containerId: number): void { this.containerId = containerId; console.log('Cmw myButton onBind:' + containerId); }
  makeNode(uiContext: UIContext): FrameNode | null {
    console.log('Cmw myButton makeNode');
    let rootNode = new BuilderNode(uiContext, { surfaceId: '', type: NodeRenderType.RENDER_TYPE_DISPLAY });
    rootNode.build(wrapBuilder<[]>(buttonBuilder));
    return rootNode.getFrameNode();
  }
  onWillUnbind(): void { console.log('Cmw myButton onWillUnbind'); }
  onUnbind(): void { console.log('Cmw myButton onUnbind:' + this.containerId); }
}

class MyTextController extends NodeController {
  private containerId: number = 0;
  onWillBind(): void { console.log('Cmw myText onWillBind'); }
  onBind(containerId: number): void { this.containerId = containerId; console.log('Cmw myText onBind:' + containerId); }
  makeNode(uiContext: UIContext): FrameNode | null {
    console.log('Cmw myText makeNode');
    let rootNode = new BuilderNode(uiContext, { surfaceId: '', type: NodeRenderType.RENDER_TYPE_DISPLAY });
    rootNode.build(wrapBuilder<[]>(textBuilder));
    return rootNode.getFrameNode();
  }
  onWillUnbind(): void { console.log('Cmw myText onWillUnbind'); }
  onUnbind(): void { console.log('Cmw myText onUnbind:' + this.containerId); }
}

@Builder
function buttonBuilder() { Button('Button').width(150).height(40) }

@Builder
function textBuilder() { Text('Text').width(150).height(40) }

@Entry
@Component
struct NodecontrollerLifeCycle0050 {
  @State buttonController: NodeController | null = new MyButtonController();
  @State textController: NodeController | null = new MyTextController();

  build() {
    Column({ space: 15 }) {
      Text('生命周期测试 - 0050')
        .fontSize(20)
        .margin({ top: 20 })

      Column({ space: 10 }) {
        Button('第一个切换绑定按钮')
          .id('toggle_button_lifecycle_0050')
          .onClick(() => {
            this.buttonController = this.buttonController ? null : new MyButtonController();
          })
        if (this.buttonController) {
          NodeContainer(this.buttonController).width(150).height(50)
        } else {
          Text('Button已解绑').width(150).height(50)
        }
      }

      Column({ space: 10 }) {
        Button('第二个切换绑定按钮')
          .id('toggle_text_lifecycle_0050')
          .onClick(() => {
            this.textController = this.textController ? null : new MyTextController();
          })
        if (this.textController) {
          NodeContainer(this.textController).width(150).height(50)
        } else {
          Text('Text已解绑').width(150).height(50)
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}