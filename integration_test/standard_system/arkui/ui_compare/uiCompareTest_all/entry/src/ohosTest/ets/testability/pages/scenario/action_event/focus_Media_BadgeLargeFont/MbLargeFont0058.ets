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

import { uiAppearance } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
class MyBadgeModifier implements AttributeModifier<BadgeAttribute> {
  constructor() {}
  applyNormalAttribute(instance: BadgeAttribute): void {
    instance.size({width:'14fp',height:'14fp'})
  }
}
class BadgeTextModifier implements AttributeModifier<TextAttribute> {
  constructor() {}
  applyNormalAttribute(instance: TextAttribute): void {
    instance.fontSize(12)
  }
}
@Entry
@Component
struct MbLargeFont0058 {
  @State modifier: MyBadgeModifier = new MyBadgeModifier();
  @State textModifier: BadgeTextModifier = new BadgeTextModifier();
  build() {
    Column() {
      Badge({
        value: 'new',
        style: {
        },
        position: BadgePosition.RightTop,
      }) {
        Text('默认提示文本')
          .attributeModifier(this.textModifier)
      }.attributeModifier(this.modifier)
      .backgroundColor(Color.Pink)
      .margin(10)

      Badge({
        value: 'new',
        style: {
          fontSize:'23vp'
        },
        position: BadgePosition.RightTop,
      }) {
        Text('1.75对比提示文本')
          .fontSize('16vp')
      }
      .backgroundColor(Color.Pink)
      .margin(10)
      .padding(15)  // 增加内边距
      .width('80%')  // 统一宽度

      // 按钮区域使用Column统一管理间距
      Column({ space: 10 }) {
        Button('set fontscale to 1.75').id('MbLF0058A').onClick(() => {
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

        Button('set fontscale to 2').id('MbLF0058B').onClick(() => {
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

        Button('set fontscale to 3.2').id('MbLF0058C').onClick(() => {
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

        Button('set fontscale to 1').id('MbLF0058D').onClick(() => {
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
      }
      .margin(10)
      .width('80%')  // 按钮区域统一宽度
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#f5f5f5')  // 增加背景色提升可读性
  }
}
