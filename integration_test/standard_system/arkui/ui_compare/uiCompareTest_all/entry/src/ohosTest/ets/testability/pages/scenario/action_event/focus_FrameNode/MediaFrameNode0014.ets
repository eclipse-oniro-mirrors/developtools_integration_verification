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

class MyNodeController001401 extends NodeController {
  makeNode(uiContext: UIContext): FrameNode  {
    let node = new FrameNode(uiContext);
    let qrCode = typeNode.createNode(uiContext, 'QRCode');
    qrCode.initialize(null).color('rgb(255, 100, 255)')
    node.appendChild(qrCode)
    return node;
  }
}

class MyNodeController001402 extends NodeController {
  makeNode(uiContext: UIContext): FrameNode  {
    let node = new FrameNode(uiContext);
    let qrCode2 = typeNode.createNode(uiContext, 'QRCode');
    qrCode2.initialize(null).color('rgba(255, 100, 255, 0.5)')
    node.appendChild(qrCode2);
    return node;
  }
}

class MyNodeController001403 extends NodeController {
  makeNode(uiContext: UIContext): FrameNode  {
    let node = new FrameNode(uiContext);
    let qrCode3 = typeNode.createNode(uiContext, 'QRCode');
    qrCode3.initialize(null).color('#ff000000')
    node.appendChild(qrCode3);
    return node;
  }
}

@Entry
@Component
struct MediaFrameNode0014 {
  private myNodeController01: MyNodeController001401 = new MyNodeController001401();
  private myNodeController02: MyNodeController001402 = new MyNodeController001402();
  private myNodeController03: MyNodeController001403 = new MyNodeController001403();
  build() {
    Column() {
      NodeContainer(this.myNodeController01)
        .padding(10)
      NodeContainer(this.myNodeController02)
        .padding(10)
      NodeContainer(this.myNodeController03);
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5');
  }

}