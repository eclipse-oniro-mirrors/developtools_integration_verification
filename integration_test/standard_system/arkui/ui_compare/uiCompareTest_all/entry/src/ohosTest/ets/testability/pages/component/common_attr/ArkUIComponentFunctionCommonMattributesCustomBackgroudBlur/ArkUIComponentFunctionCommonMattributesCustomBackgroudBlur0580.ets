/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct ArkUIComponentFunctionCommonMattributesCustomBackgroudBlur0580 {
  build() {
    Row() {
      Column() {
        Button('click for Menu')
          .id('bindMenu')
          .bindMenu([
            {
              value: 'Menu1',
              action: () => {
                console.info('handle Menu1 select');
              }
            },
            {
              value: 'Menu2',
              action: () => {
                console.info('handle Menu2 select');
              }
            },
          ], {
            backgroundBlurStyleOptions: {
              blurOptions: {
                grayscale: [0, 0]
              }
            },
            backgroundEffect: {
              radius: 30,
              blurOptions: {
                grayscale: [127, 127]
              }
            },
            modalMode: 1,
            backgroundColor: '#00000000'
          })
      }.width('100%')
    }.height('100%')
  }
}
