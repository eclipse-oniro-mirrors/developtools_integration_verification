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

import { uiAppearance, NodeController, FrameNode, typeNode } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';


class MyNodeController0059 extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    let badgeCode = typeNode.createNode(uiContext, 'Badge');
    badgeCode.initialize({count:99, style: {}, position: BadgePosition.RightTop,})
    node.appendChild(badgeCode);
    let  textCode = typeNode.createNode(uiContext, 'Text');
    textCode.initialize('默认提示文本')
    badgeCode.appendChild(textCode)
    return node;
  }
}
@Entry
@Component
struct MbLargeFont0059 {
  private myNodeController: MyNodeController0059 = new MyNodeController0059();
  build() {
    Column() {
      NodeContainer(this.myNodeController)
        .margin(10)

      Badge({
        count:99,
        style: {
          fontSize: '23vp',
        },
        position: BadgePosition.RightTop,
      }) {
        Text('1.75对比提示文本')
          .fontSize('16vp')
      }
      .margin(10)


      Button('set fontscale to 1.75').id('MbLF0059A').onClick(() => {
        try {
          uiAppearance.setFontScale(1.75).then(() => {
            console.info('Set fontScale successfully.');
          }).catch((error: Error) => {
            console.error('Set fontScale failed, ' + error.message);
          });
        } catch (error) {
          let message = (error as BusinessError).message;
          console.error('Set fontScale failed, ' + message);
        }
      })
        .margin(10)

      Button('set fontscale to 2').id('MbLF0059B').onClick(() => {
        try {
          uiAppearance.setFontScale(2).then(() => {
            console.info('Set fontScale successfully.');
          }).catch((error: Error) => {
            console.error('Set fontScale failed, ' + error.message);
          });
        } catch (error) {
          let message = (error as BusinessError).message;
          console.error('Set fontScale failed, ' + message);
        }
      })
        .margin(10)

      Button('set fontscale to 3.2').id('MbLF0059C').onClick(() => {
        try {
          uiAppearance.setFontScale(3.2).then(() => {
            console.info('Set fontScale successfully.');
          }).catch((error: Error) => {
            console.error('Set fontScale failed, ' + error.message);
          });
        } catch (error) {
          let message = (error as BusinessError).message;
          console.error('Set fontScale failed, ' + message);
        }
      })
        .margin(10)

      Button('set fontscale to 1').id('MbLF0059D').onClick(() => {
        try {
          uiAppearance.setFontScale(1).then(() => {
            console.info('Set fontScale successfully.');
          }).catch((error: Error) => {
            console.error('Set fontScale failed, ' + error.message);
          });
        } catch (error) {
          let message = (error as BusinessError).message;
          console.error('Set fontScale failed, ' + message);
        }
      })
        .margin(10)
    }
  }
}

