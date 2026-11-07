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
struct ProgressBackground0010 {
  @Builder
  CustomLinearBackground() {
    Column() {
      Row() {
        ForEach([1, 2, 3, 4, 5], (item: number) => {
          Column() {
            Text('●').fontSize(8).fontColor(Color.Blue)
            Text('●').fontSize(8).fontColor(Color.Green)
            Text('●').fontSize(8).fontColor(Color.Red)
          }
          .margin({ right: 4 })
        })
      }
      Row() {
        ForEach([1, 2, 3, 4, 5], (item: number) => {
          Column() {
            Text('●').fontSize(8).fontColor(Color.Yellow)
            Text('●').fontSize(8).fontColor(Color.Brown)
            Text('●').fontSize(8).fontColor(Color.Orange)
          }
          .margin({ right: 4 })
        })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Brown)
  }

  @Builder
  CustomEclipseBackground() {
    Stack() {
      Circle({ width: 100, height: 60 })
        .fill(Color.Red)
        .opacity(0.3)
      Row() {
        ForEach([1, 2, 3, 4, 5], (item: number) => {
          Text('★').fontSize(12).fontColor(Color.Red)
            .margin({ right: 8 })
        })
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  CustomScaleRingBackground() {
    Stack() {
      Circle({ width: 90, height: 90 })
        .fill(Color.Pink)
        .opacity(0.2)
      Column() {
        ForEach([1, 2, 3, 4], (item: number) => {
          Row() {
            ForEach([1, 2, 3, 4], (col: number) => {
              Text('◆').fontSize(10).fontColor(Color.Green)
                .margin({ right: 4, bottom: 4 })
            })
          }
        })
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  CustomRingBackground() {
    Stack() {
      Circle({ width: 90, height: 90 })
        .fill(Color.Gray)
        .opacity(0.3)
      Column() {
        Text('●').fontSize(16).fontColor(Color.Yellow)
        Text('●').fontSize(12).fontColor(Color.Blue)
        Text('●').fontSize(16).fontColor(Color.Orange)
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  CustomCapsuleBackground() {
    Row() {
      ForEach([1, 2, 3, 4, 5, 6], (item: number) => {
        Text('■').fontSize(8).fontColor(Color.Grey)
          .margin({ right: 2 })
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Green)
    .borderRadius(20)
  }

  build() {
    Column({ space: 20 }) {
      // 1. Linear Progress - 線性進度條，自定義背景
      Text('1. Linear Progress (線性進度條) - 自定義背景').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Column({ space: 10 }) {
        Progress({ value: 30, total: 100, type: ProgressType.Linear })
          .width(200)
          .height(20)
          .background(this.CustomLinearBackground)
          .color(Color.Green)
          .style({ strokeWidth: 20, strokeRadius: 10 })
        
        Progress({ value: 40, total: 100, type: ProgressType.Linear })
          .width(200)
          .height(20)
          .background(this.CustomLinearBackground)
          .color(Color.Blue)
          .style({ strokeWidth: 20, strokeRadius: 10 })
      }

      // 2. Eclipse Progress - 橢圓形進度條，自定義背景
      Text('2. Eclipse Progress (橢圓形進度條) - 自定義背景').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Row({ space: 20 }) {
        Progress({ value: 25, total: 100, type: ProgressType.Eclipse })
          .width(100)
          .height(60)
          .background(this.CustomEclipseBackground)
          .color(Color.Pink)
        
        Progress({ value: 75, total: 100, type: ProgressType.Eclipse })
          .width(100)
          .height(60)
          .background(this.CustomEclipseBackground)
          .color(Color.Orange)
      }

      // 3. ScaleRing Progress - 刻度環形進度條，自定義背景
      Text('3. ScaleRing Progress (刻度環形進度條) - 自定義背景').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Row({ space: 30 }) {
        Progress({ value: 40, total: 100, type: ProgressType.ScaleRing })
          .width(90)
          .height(90)
          .background(this.CustomScaleRingBackground)
          .color(Color.Red)
          .style({ strokeWidth: 15, scaleCount: 20, scaleWidth: 4 })
        
        Progress({ value: 80, total: 100, type: ProgressType.ScaleRing })
          .width(90)
          .height(90)
          .background(this.CustomScaleRingBackground)
          .color(Color.Red)
          .style({ strokeWidth: 15, scaleCount: 30, scaleWidth: 3 })
      }

      // 4. Ring Progress - 環形進度條，自定義背景
      Text('4. Ring Progress (環形進度條) - 自定義背景').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Row({ space: 30 }) {
        Progress({ value: 35, total: 100, type: ProgressType.Ring })
          .width(90)
          .height(90)
          .background(this.CustomRingBackground)
          .color(Color.Yellow)
          .style({ strokeWidth: 20 })
        
        Progress({ value: 90, total: 100, type: ProgressType.Ring })
          .width(90)
          .height(90)
          .background(this.CustomRingBackground)
          .color(Color.Yellow)
          .style({ strokeWidth: 20 })
      }

      // 5. Capsule Progress - 膠囊形進度條，自定義背景
      Text('5. Capsule Progress (膠囊形進度條) - 自定義背景').fontSize(16).fontColor(0x333333).width('90%').fontWeight(FontWeight.Bold)
      Row({ space: 30 }) {
        Progress({ value: 20, total: 100, type: ProgressType.Capsule })
          .width(80)
          .height(35)
          .background(this.CustomCapsuleBackground)
          .color(Color.Brown)
        
        Progress({ value: 65, total: 100, type: ProgressType.Capsule })
          .width(80)
          .height(35)
          .background(this.CustomCapsuleBackground)
          .color(Color.Brown)
      }

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xf8f9fa)
  }
}
