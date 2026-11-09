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
struct ProgressBackground0017 {
  build() {
    Column({ space: 20 }) {
      // 1. Linear Progress - 線性進度條，設置ImageRepeatXY
      Text('1. Linear Progress (線性進度條) - 設置ImageRepeatXY').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Progress({ value: 30, total: 100, type: ProgressType.Linear })
        .width(200)
        .height(20)
        .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
        .color(Color.Green)
        .style({ strokeWidth: 20, strokeRadius: 10 })
        .margin({ bottom: 10 })

      // 2. Eclipse Progress - 橢圓形進度條，設置ImageRepeatXY
      Text('2. Eclipse Progress (橢圓形進度條) - 設置ImageRepeatXY').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Row({ space: 20 }) {
        Progress({ value: 25, total: 100, type: ProgressType.Eclipse })
          .width(110)
          .height(60)
          .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
          .color(Color.Pink)
        
        Progress({ value: 75, total: 100, type: ProgressType.Eclipse })
          .width(110)
          .height(60)
          .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
          .color(Color.Pink)
      }

      // 3. ScaleRing Progress - 刻度環形進度條，設置ImageRepeatXY
      Text('3. ScaleRing Progress (刻度環形進度條) - 設置ImageRepeatXY').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Row({ space: 40 }) {
        Progress({ value: 40, total: 100, type: ProgressType.ScaleRing })
          .width(100)
          .height(100)
          .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
          .color(Color.Orange)
          .style({ strokeWidth: 15, scaleCount: 20, scaleWidth: 4 })
        
        Progress({ value: 80, total: 100, type: ProgressType.ScaleRing })
          .width(100)
          .height(100)
          .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
          .color(Color.Orange)
          .style({ strokeWidth: 15, scaleCount: 30, scaleWidth: 3 })
      }

      // 4. Ring Progress - 環形進度條，設置ImageRepeatXY
      Text('4. Ring Progress (環形進度條) - 設置ImageRepeatXY').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Row({ space: 40 }) {
        Progress({ value: 35, total: 100, type: ProgressType.Ring })
          .width(100)
          .height(100)
          .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
          .color(Color.Yellow)
          .style({ strokeWidth: 20 })
        
        Progress({ value: 90, total: 100, type: ProgressType.Ring })
          .width(100)
          .height(100)
          .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
          .color(Color.Yellow)
          .style({ strokeWidth: 20 })
      }

      // 5. Capsule Progress - 膠囊形進度條，設置ImageRepeatXY
      Text('5. Capsule Progress (膠囊形進度條) - 設置ImageRepeatXY').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Row({ space: 40 }) {
        Progress({ value: 20, total: 100, type: ProgressType.Capsule })
          .width(90)
          .height(40)
          .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
          .color(Color.Red)
        
        Progress({ value: 65, total: 100, type: ProgressType.Capsule })
          .width(90)
          .height(40)
          .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
          .color(Color.Red)
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xf8f9fa)
  }
}
