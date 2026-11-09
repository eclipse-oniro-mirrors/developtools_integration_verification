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

import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct PopupboxEnter0430 {
  build() {
    Column({ space: 5 }) {
      Button('showDialog outer')
        .defaultFocus(true)
        .id('PopupboxEnter0430_001')
        .onClick(() => {
          promptAction.showDialog({
            title: 'outer dialog',
            message: 'This is outer dialog',
            buttons: [
              {
                text: 'open inner',
                color: '#000000'
              }
            ]
          }).then(data => {
            if (data.index === 0) {
              promptAction.showDialog({
                title: 'inner dialog',
                message: 'This is inner dialog',
                buttons: [
                  {
                    text: 'button',
                    color: '#000000'
                  }
                ]
              }).then(innerData => {
                console.info('inner showDialog success, click button: ' + innerData.index);
              }).catch((err: Error) => {
                console.info('inner showDialog error: ' + err);
              })
            }
          }).catch((err: Error) => {
            console.info('outer showDialog error: ' + err);
          })
        })
        .backgroundColor(0x317aff)
    }.width('100%').margin({ top: 5 })
  }
}

