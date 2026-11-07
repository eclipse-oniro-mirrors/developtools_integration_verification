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
struct ProgressBackground0013 {
  build() {
    Column({ space: 20 }) {
      
      // 1. Linear Progress - 線性進度條，引入不同類型圖源
      Text('1. Linear Progress (線性進度條) - 引入不同類型圖源').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Column({ space: 10 }) {
        Progress({ value: 30, total: 100, type: ProgressType.Linear })
          .width(200)
          .height(20)
          .backgroundImage($r('app.media.test1'))  // PNG類型
          .color(Color.Green)
          .style({ strokeWidth: 20, strokeRadius: 10 })
        
        Progress({ value: 40, total: 100, type: ProgressType.Linear })
          .width(200)
          .height(20)
          .backgroundImage($r('app.media.test2'))  // JPG類型
          .color(Color.Blue)
          .style({ strokeWidth: 20, strokeRadius: 10 })
      }

      // 2. Eclipse Progress - 橢圓形進度條，引入不同類型圖源
      Text('2. Eclipse Progress (橢圓形進度條) - 引入不同類型圖源').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Row({ space: 20 }) {
        Progress({ value: 25, total: 100, type: ProgressType.Eclipse })
          .width(100)
          .height(60)
          .backgroundImage($r('app.media.test3'))  // JPEG類型
          .color(Color.Pink)
        
        Progress({ value: 75, total: 100, type: ProgressType.Eclipse })
          .width(100)
          .height(60)
          .backgroundImage($r('app.media.test4'))  // BMP類型
          .color(Color.Orange)
      }

      // 3. ScaleRing Progress - 刻度環形進度條，引入不同類型圖源
      Text('3. ScaleRing Progress (刻度環形進度條) - 引入不同類型圖源').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Row({ space: 30 }) {
        Progress({ value: 40, total: 100, type: ProgressType.ScaleRing })
          .width(90)
          .height(90)
          .backgroundImage($r('app.media.test5'))  // WEBP類型
          .color(Color.Red)
          .style({ strokeWidth: 15, scaleCount: 20, scaleWidth: 4 })
        
        Progress({ value: 80, total: 100, type: ProgressType.ScaleRing })
          .width(90)
          .height(90)
          .backgroundImage($r('app.media.test1'))  // GIF類型
          .color(Color.Red)
          .style({ strokeWidth: 15, scaleCount: 30, scaleWidth: 3 })
      }

      // 4. Ring Progress - 環形進度條，引入不同類型圖源
      Text('4. Ring Progress (環形進度條) - 引入不同類型圖源').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Row({ space: 30 }) {
        Progress({ value: 35, total: 100, type: ProgressType.Ring })
          .width(90)
          .height(90)
          .backgroundImage($r('app.media.test2'))  // HEIF類型
          .color(Color.Yellow)
          .style({ strokeWidth: 20 })
        
        Progress({ value: 90, total: 100, type: ProgressType.Ring })
          .width(90)
          .height(90)
          .backgroundImage($r('app.media.test3'))  // PNG類型
          .color(Color.Yellow)
          .style({ strokeWidth: 20 })
      }

      // 5. Capsule Progress - 膠囊形進度條，引入不同類型圖源
      Text('5. Capsule Progress (膠囊形進度條) - 引入不同類型圖源').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Row({ space: 30 }) {
        Progress({ value: 20, total: 100, type: ProgressType.Capsule })
          .width(80)
          .height(35)
          .backgroundImage($r('app.media.test4'))  // JPG類型
          .color(Color.Brown)
        
        Progress({ value: 65, total: 100, type: ProgressType.Capsule })
          .width(80)
          .height(35)
          .backgroundImage($r('app.media.test5'))  // JPEG類型
          .color(Color.Brown)
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xf8f9fa)
  }
}
