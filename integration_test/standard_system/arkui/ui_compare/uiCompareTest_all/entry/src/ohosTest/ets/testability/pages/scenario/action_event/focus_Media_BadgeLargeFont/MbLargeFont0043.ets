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

@Entry
@Component
struct MbLargeFont0043 {
  build() {
    Column() {
      Badge({
        value: 'new',
        style: {
          fontSize:'20fp'
        },
        position: BadgePosition.RightTop,
      }) {
        Text('默认提示文本')
          .fontSize('16fp')
      }
      .backgroundColor(Color.Pink)
      .margin(10)

      Button('set fontscale to 1.15').id('MbLF0043A').onClick(()=>{
        try {
          uiAppearance.setFontScale(1.15).then(() => {
            console.info('Set fontScale successfully.');
          }).catch((error:Error) => {
            console.error('Set fontScale failed, ' + error.message);
          });
        } catch (error) {
          let message = (error as BusinessError).message;
          console.error('Set fontScale failed, ' + message);
        }
      })
        .margin(10)

      Button('set fontscale to 1.3').id('MbLF0043B').onClick(()=>{
        try {
          uiAppearance.setFontScale(1.3).then(() => {
            console.info('Set fontScale successfully.');
          }).catch((error:Error) => {
            console.error('Set fontScale failed, ' + error.message);
          });
        } catch (error) {
          let message = (error as BusinessError).message;
          console.error('Set fontScale failed, ' + message);
        }
      })
        .margin(10)

      Button('set fontscale to 1.45').id('MbLF0043C').onClick(()=>{
        try {
          uiAppearance.setFontScale(1.45).then(() => {
            console.info('Set fontScale successfully.');
          }).catch((error:Error) => {
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
