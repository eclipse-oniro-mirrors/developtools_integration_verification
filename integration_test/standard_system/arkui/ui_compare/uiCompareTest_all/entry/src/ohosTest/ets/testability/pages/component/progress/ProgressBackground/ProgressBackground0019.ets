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
struct ProgressBackground0019 {
  build() {
    Column({ space: 20 }) {
      
      // 1. Linear Progress - 線性進度條，backgroundColor + ImageRepeatXY
      Text('1. Linear Progress (線性進度條) - backgroundColor + ImageRepeatXY').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Progress({ value: 30, total: 100, type: ProgressType.Linear })
        .width(200)
        .height(20)
        .backgroundColor(Color.Gray)
        .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
        .color(new LinearGradient([{ color: '#FF6B6B', offset: 0 }, { color: '#4ECDC4', offset: 1 }]))
        .style({ strokeWidth: 20, strokeRadius: 10 })
        .margin({ bottom: 10 })

      // 2. Eclipse Progress - 橢圓形進度條，backgroundColor + ImageRepeatXY
      Text('2. Eclipse Progress (橢圓形進度條) - backgroundColor + ImageRepeatXY').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Row({ space: 20 }) {
        Progress({ value: 25, total: 100, type: ProgressType.Eclipse })
          .width(110)
          .height(60)
          .backgroundColor(Color.Brown)
          .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
          .color(new LinearGradient([{ color: '#A8E6CF', offset: 0 }, { color: '#FFD3B6', offset: 1 }]))
        
        Progress({ value: 75, total: 100, type: ProgressType.Eclipse })
          .width(110)
          .height(60)
          .backgroundColor(Color.Green)
          .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
          .color(new LinearGradient([{ color: '#FF8B94', offset: 0 }, { color: '#FFC3A0', offset: 1 }]))
      }

      // 3. ScaleRing Progress - 刻度環形進度條，backgroundColor + ImageRepeatXY
      Text('3. ScaleRing Progress (刻度環形進度條) - backgroundColor + ImageRepeatXY').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Row({ space: 40 }) {
        Progress({ value: 40, total: 100, type: ProgressType.ScaleRing })
          .width(100)
          .height(100)
          .backgroundColor(Color.Orange)
          .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
          .color(new LinearGradient([{ color: '#FFEAA7', offset: 0 }, { color: '#DDA0DD', offset: 1 }]))
          .style({ strokeWidth: 15, scaleCount: 20, scaleWidth: 4 })
        
        Progress({ value: 80, total: 100, type: ProgressType.ScaleRing })
          .width(100)
          .height(100)
          .backgroundColor(Color.Pink)
          .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
          .color(new LinearGradient([{ color: '#98d7C8', offset: 0 }, { color: '#F7DC6F', offset: 1 }]))
          .style({ strokeWidth: 15, scaleCount: 30, scaleWidth: 3 })
      }

      // 4. Ring Progress - 環形進度條，backgroundColor + ImageRepeatXY
      Text('4. Ring Progress (環形進度條) - backgroundColor + ImageRepeatXY').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Row({ space: 40 }) {
        Progress({ value: 35, total: 100, type: ProgressType.Ring })
          .width(100)
          .height(100)
          .backgroundColor(Color.Red)
          .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
          .color(new LinearGradient([{ color: '#B8E6B8', offset: 0 }, { color: '#FFB6C1', offset: 1 }]))
          .style({ strokeWidth: 20 })
        
        Progress({ value: 90, total: 100, type: ProgressType.Ring })
          .width(100)
          .height(100)
          .backgroundColor(Color.Yellow)
          .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
          .color(new LinearGradient([{ color: '#87CEEB', offset: 0 }, { color: '#DDA0DD', offset: 1 }]))
          .style({ strokeWidth: 20 })
      }

      // 5. Capsule Progress - 膠囊形進度條，backgroundColor + ImageRepeatXY
      Text('5. Capsule Progress (膠囊形進度條) - backgroundColor + ImageRepeatXY').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Row({ space: 40 }) {
        Progress({ value: 20, total: 100, type: ProgressType.Capsule })
          .width(90)
          .height(40)
          .backgroundColor(Color.Black)
          .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
          .color(new LinearGradient([{ color: '#F0E68C', offset: 0 }, { color: '#Cd753F', offset: 1 }]))
        
        Progress({ value: 65, total: 100, type: ProgressType.Capsule })
          .width(90)
          .height(40)
          .backgroundColor(Color.Grey)
          .backgroundImage($r('app.media.icon'), ImageRepeat.XY)
          .color(new LinearGradient([{ color: '#E6E6FA', offset: 0 }, { color: '#FF69B4', offset: 1 }]))
      }

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xf8f9fa)
  }
}
