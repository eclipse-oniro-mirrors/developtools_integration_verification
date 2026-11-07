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
struct ActionEventCommonEventFrameNodeGesture06 {
  @State count: number = 0
  @State text :string = ''
  @State mycolor:Color=Color.Black
  @State rotateAngle: number = 0
  @State speed: number = 1

  build() {
    Column() {
      Text('SwipeGesture speed\n' + this.speed+'SwipeGesture angle\n' + this.rotateAngle)
        .fontSize(10)
        .fontColor(0xCCCCCC)
        .width('90%')
        .border({ width: 1 })
        .lineHeight(20)
        .margin(30)
        .padding(10)
        .textOverflow({ overflow: TextOverflow.None })
        .maxLines(4)
        .fontColor(Color.Black)
        .fontStyle(FontStyle.Italic)
        .rotate({ angle: this.rotateAngle })
        .id('ActionEventCommonEventFrameNodeGesture06')
        .gesture(
          SwipeGesture({ direction: SwipeDirection.All,isFingerCountLimited:true,fingers:1 })
            .onAction((event: GestureEvent) => {
              if (event) {
                this.speed = event.speed
                this.rotateAngle = event.angle
                this.mycolor=Color.Red
              }
            })
        )
      Text('onAction success')
        .fontSize(15)
        .fontColor(this.mycolor)
        .width('90%')
        .border({ width: 1 })
        .lineHeight(20)
        .margin(30)
        .padding(10)
    }
    .height('100%')
    .width('100%')
    .padding(20)
    .border({ width: 3 })
    .margin(30)
  }
}
