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
struct ActionEventCommonEventFrameNodeGesture02 {
  @State count: number = 0
  @State text :string = ''
  @State mycolor:Color=Color.Black
  @State offsetX: number = 0
  @State offsetY: number = 0
  @State positionX: number = 0
  @State positionY: number = 0

  build() {
    Column() {
      Text('PanGesture offset:\nX: ' + this.offsetX + '\n' + 'Y: ' + this.offsetY)
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
        .id('ActionEventCommonEventFrameNodeGesture02')
        .gesture(
          PanGesture({fingers:1,direction:PanDirection.All,isFingerCountLimited:true})
            .onActionStart((event: GestureEvent) => {
              console.info('Pan start')
              this.mycolor=Color.Red
            })
            .onActionUpdate((event: GestureEvent) => {
              if (event) {
                this.offsetX = this.positionX + event.offsetX
                this.offsetY = this.positionY + event.offsetY
              }
            })
            .onActionEnd(() => {
              this.positionX = this.offsetX
              this.positionY = this.offsetY
              console.info('Pan end')
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
