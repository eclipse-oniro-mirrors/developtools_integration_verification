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
struct MbLargeFont0048 {
  @State visible:Visibility = Visibility.Hidden
  build() {
    Column() {
      Badge({
        value: 'new',
        style: {
          fontSize:'30fp'
        },
        position: BadgePosition.RightTop,
      }) {
        Text('对比提示文本')
          .fontSize('16vp')
      }
      .margin(10)

      Badge({
        value: 'new',
        style: {
          fontSize:'30fp'
        },
        position: BadgePosition.RightTop,
      }) {
        Text('默认提示文本')
      }.visibility(this.visible)
      .margin(10)

      Button('set fontscale to 2').id('MbLF0048A').onClick(()=>{
        try {
          uiAppearance.setFontScale(2).then(() => {
            console.info('Set fontScale successfully.');
          }).catch((error:Error) => {
            console.error('Set fontScale failed, ' + error.message);
          });
        } catch (error) {
          let message = (error as BusinessError).message;
          console.error('Set fontScale failed, ' + message);
        }
        this.visible = Visibility.Visible
      })
        .margin(10)
    }.width('100%')

  }
}
