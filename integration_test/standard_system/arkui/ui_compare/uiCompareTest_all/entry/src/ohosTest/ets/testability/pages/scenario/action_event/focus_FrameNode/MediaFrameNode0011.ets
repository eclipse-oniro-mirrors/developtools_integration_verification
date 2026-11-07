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

class MyNodeController0011 extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let baseContent = '1111111111cccccc'
    let result = ''
    while (result.length < 600) {
      result += baseContent
    }
    let node = new FrameNode(uiContext);
    let qrCode = typeNode.createNode(uiContext, 'QRCode');
    qrCode.initialize(result)
    node.appendChild(qrCode);
    return node;
  }
}

@Entry
@Component
struct MediaFrameNode0011 {
  private myNodeController: MyNodeController0011 = new MyNodeController0011();
  build() {
    Column() {
      NodeContainer(this.myNodeController);
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5');
  }

}