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


@Entry
@Component
struct InfomationGaugeEffect0090 {


  build() {
    Column({ space: 15 }) {
      Text('Gradient Color')
        .fontSize(19)
        .fontColor(0xCCCCCC)
        .width('90%')
      Progress({ value: 70, total: 100, type: ProgressType.Ring })
        .width(100)
        .style({ strokeWidth: 20 })
        .color($r('app.color.Pink'))

      Text('Shadow')
        .fontSize(19)
        .fontColor(0xCCCCCC)
        .width('90%')
      Progress({ value: 70, total: 100, type: ProgressType.Ring })
        .width(120)
        .color($r('app.color.Pink'))
        .style({ strokeWidth: 20, shadow: true })
    }
    .width('100%')
    .padding({ top: 5 })
  }
}

