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
struct MbBorder0065 {

  build() {
    Column() {
      Badge({
        count: 99,
        style: {
          borderColor:Color.Green,
          fontSize:16
        },
        position: BadgePosition.RightTop,
      }) {
        Text('默认提示文本')
          .fontSize(25)
          .border({
            width: {
              start: LengthMetrics.vp(3),
              end: LengthMetrics.vp(3),
              top: LengthMetrics.vp(3),
              bottom: LengthMetrics.vp(3)
            },
            color: { start:Color.Pink},
            radius: {
              topStart: LengthMetrics.vp(10),
              topEnd: LengthMetrics.vp(10),
              bottomStart: LengthMetrics.vp(10),
              bottomEnd: LengthMetrics.vp(10)
            },
            style: {
              left: BorderStyle.Solid,
              right: BorderStyle.Solid,
              top: BorderStyle.Solid,
              bottom: BorderStyle.Solid
            }
          })
      }

    }
  }
}
