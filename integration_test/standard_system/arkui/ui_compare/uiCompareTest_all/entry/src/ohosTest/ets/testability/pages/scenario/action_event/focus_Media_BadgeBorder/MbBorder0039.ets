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
import { LengthMetrics } from '@kit.ArkUI';
@Entry
@Component
struct MbBorder0039 {

  build() {
    Column() {
      Badge({
        count: 99,
        style: {
          borderColor:0xffff00,
          borderWidth:3,
          fontSize: 20,
        },
        position: BadgePosition.RightTop,
      }) {
        Text('默认提示文本')
          .border({
            width: { left:1,top:5,bottom: 7,right:3 },
            color: { left: '#e3bbbb', right: Color.Blue, top: Color.Red, bottom: Color.Green },
            radius: { topLeft: 10, topRight: 10, bottomLeft: 10, bottomRight: 10 },
            style: {
              left: BorderStyle.Solid,
              right: BorderStyle.Solid,
              top: BorderStyle.Solid,
              bottom: BorderStyle.Solid
            }
          })
          .width('80%')
          .padding(15)
          .margin(10)
      }

      Badge({
        count: 99,
        style: {
          borderColor:0xffff00,
          borderWidth:1,
          fontSize: 20,
        },
        position: BadgePosition.RightTop,
      }) {
        Text('对比提示文本')
          .border({
            width: { left: 3, right: 3, top: 3, bottom: 3 },
            color: { left: '#e3bbbb', right: Color.Blue, top: Color.Red, bottom: Color.Green },
            radius: { topLeft: 10, topRight: 10, bottomLeft: 10, bottomRight: 10 },
            style: {
              left: BorderStyle.Solid,
              right: BorderStyle.Solid,
              top: BorderStyle.Solid,
              bottom: BorderStyle.Solid
            }
          })
          .width('80%')
          .padding(15)
          .margin(10)
      }

    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
