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
struct ActionGestureConfiguration02 {
  @State count: number = 0
  @State text :string = ''
  @State mycolor:Color=Color.Black
  @State rotateAngle: number = 0
  @State speed: number = 1
  @State message: string = 'Gesture';

  build() {
    Column() {
      Text(this.message)
        .fontSize(10)
        .fontColor(0xCCCCCC)
        .width('90%')
        .border({ width: 1 })
        .lineHeight(20)
        .margin(30)
        .padding(10)
        .textOverflow({ overflow: TextOverflow.None })
        .maxLines(10)
        .fontStyle(FontStyle.Italic)
        .rotate({ angle: this.rotateAngle })
      Button('Gesture test')
        .fontSize(10)
        .height(100)
        .backgroundColor(0x317aff)
        .width('90%')
        .labelStyle({ overflow: TextOverflow.Clip,
          maxLines: 2,
          minFontSize: 10,
          maxFontSize: 20,
          font: {
            size: 20,
            weight: FontWeight.Bolder,
            family: 'cursive',
            style: FontStyle.Italic
          }
        })
        .id('ActionGestureConfiguration02')
        .gesture(
          LongPressGesture()
            .onAction((event: GestureEvent) => {
              if (event && event.repeat) {
                this.count++
              }
            })
            .onActionEnd((event: GestureEvent) => {
              this.count = 0
            })
        )
        .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
          others: GestureRecognizer[]) => {
          if (current) {
            if (current.getType() == GestureControl.GestureType.PAN_GESTURE) {
              let target = current as PanRecognizer;
              this.message = 'PanGesture\ndistance:' + target.getPanGestureOptions().getDistance() + '\nfingers:' +
              target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit();
            }
            if (current.getType() == GestureControl.GestureType.LONG_PRESS_GESTURE) {
              let target = current as LongPressRecognizer;
              this.message = 'LongPressGesture\nfingers:' + target.getFingerCount() + '\nisFingerCountLimited:' +
              target.isFingerCountLimit() + '\nrepeat:' + target.isRepeat() + '\nduration:' + target.getDuration();
            }
            if (current.getType() == GestureControl.GestureType.PINCH_GESTURE) {
              let target = current as PinchRecognizer;
              this.message = 'PinchGesture\ndistance:' + target.getDistance() + '\nfingers:' +
              target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit();
            }
            if (current.getType() == GestureControl.GestureType.TAP_GESTURE) {
              let target = current as TapRecognizer;
              this.message = 'TapGesture\ncount:' + target.getTapCount() + '\nfingers:' +
              target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit();
            }
            if (current.getType() == GestureControl.GestureType.ROTATION_GESTURE) {
              let target = current as RotationRecognizer;
              this.message = 'RotationGesture\nangle:' + target.getAngle() + '\nfingers:' +
              target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit();
            }
            if (current.getType() == GestureControl.GestureType.SWIPE_GESTURE) {
              let target = current as SwipeRecognizer;
              this.message = 'SwipeGesture\ndirection:' + target.getDirection() + '\nfingers:' +
              target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit() + '\nspeed:' +
              target.getVelocityThreshold();
            }
          }
          return GestureJudgeResult.CONTINUE;
        })
    }
    .height('100%')
    .width('100%')
    .padding(20)
    .margin(30)
  }
}
