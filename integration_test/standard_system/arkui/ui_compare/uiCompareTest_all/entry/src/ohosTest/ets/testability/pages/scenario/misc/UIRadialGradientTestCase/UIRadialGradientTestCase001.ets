/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
struct RadialGradientComparison {
  @State resRadius: Resource = $r('app.float.boardSize_10')

  build() {
    Row() {
      // 第一个Row：使用number类型参数
      Row()
        .width('300px')
        .height('300px')
        .radialGradient({
          center: ['50%', '50%'],
          colors: [
            [0xff0000, 0.0],
            [0x0000ff, 0.3],
            [0xffff00, 1.0]
          ],
          radius: 60
        })
        .border({ width: 1, color: Color.Black })
        .margin(10)
      // 第二个Row：使用Resource类型参数
      Row()
        .width('300px')
        .height('300px')
        .radialGradient({
          center: ['50%', '50%'],
          colors: [
            [0xff0000, 0.0],
            [0x0000ff, 0.3],
            [0xffff00, 1.0]
          ],
          radius: this.resRadius
        })
        .border({ width: 1, color: Color.Black })
        .margin(10)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
    .alignItems(VerticalAlign.Center)
  }
}