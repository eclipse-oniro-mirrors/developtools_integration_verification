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
struct ActionGestureConfiguration12 {
  @State message: string = 'TapGesture fingers=2.5测试'
  @State gestureInfo: string = '等待获取手势信息...'
  @State tapCount: number = 0
  @State currentGestureInfo: BaseGestureEvent | null = null
  @State testResults: string = '未开始测试'
  @State buttonClickCount: number = 0

  build() {
    Column() {
      Text(this.message)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({
          top: 15,
          bottom: 10,
          left:10,
          right:10
        })
        .fontColor('#2E2E2E')
        .textAlign(TextAlign.Center)

      Column() {
        Text('手势信息')
          .height(40)
          .textAlign(TextAlign.Start)
          .fontColor(Color.Black)
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin({bottom:6})
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .alignSelf(ItemAlign.Start)
          .fontColor('#2E2E2E')

        Text(this.gestureInfo)
          .fontSize(12)
          .fontColor('#333333')
          .textAlign(TextAlign.Start)
          .padding(12)
          .backgroundColor('#E8F4FD')
          .borderRadius(8)
          .width('100%')
      }
      .width('90%')
      .alignItems(HorizontalAlign.Start)
      .margin({ bottom: 30 })

      Button('测试按钮')
        .id('ActionGestureConfiguration12')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('80%')
        .height(60)
        .backgroundColor('#007AFF')
        .borderRadius(12)
        .fontColor(Color.White)
        .margin({ bottom: 10 })
        .labelStyle({
          overflow: TextOverflow.Clip,
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
        .gesture(
          TapGesture({ fingers: 2.5 })
            .onAction((event: GestureEvent) => {
              this.buttonClickCount++;
              this.tapCount = 2;
              this.testResults = `手势触发成功！\n触发次数: ${this.buttonClickCount}\n预期fingers: 2\n实际fingers: ${this.tapCount}`;
              console.info(`TapGesture点击触发次数: ${this.buttonClickCount}`);
            })
        )
        .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
          others: GestureRecognizer[]) => {
          if (current) {
            if (current.getType() == GestureControl.GestureType.PAN_GESTURE) {
              let target = current as PanRecognizer;
              this.gestureInfo = 'PanGesture\ndistance:' + target.getPanGestureOptions().getDistance() + '\nfingers:' +
              target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit();
            }
            if (current.getType() == GestureControl.GestureType.LONG_PRESS_GESTURE) {
              let target = current as LongPressRecognizer;
              this.gestureInfo = 'LongPressGesture\nfingers:' + target.getFingerCount() + '\nisFingerCountLimited:' +
              target.isFingerCountLimit() + '\nrepeat:' + target.isRepeat() + '\nduration:' + target.getDuration();
            }
            if (current.getType() == GestureControl.GestureType.PINCH_GESTURE) {
              let target = current as PinchRecognizer;
              this.gestureInfo = 'PinchGesture\ndistance:' + target.getDistance() + '\nfingers:' +
              target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit();
            }
            if (current.getType() == GestureControl.GestureType.TAP_GESTURE) {
              let target = current as TapRecognizer;
              this.gestureInfo = 'TapGesture\ncount:' + target.getTapCount() + '\nfingers:' +
              target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit();
            }
            if (current.getType() == GestureControl.GestureType.ROTATION_GESTURE) {
              let target = current as RotationRecognizer;
              this.gestureInfo = 'RotationGesture\nangle:' + target.getAngle() + '\nfingers:' +
              target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit();
            }
            if (current.getType() == GestureControl.GestureType.SWIPE_GESTURE) {
              let target = current as SwipeRecognizer;
              this.gestureInfo = 'SwipeGesture\ndirection:' + target.getDirection() + '\nfingers:' +
              target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit() + '\nspeed:' +
              target.getVelocityThreshold();
            }
          }
          return GestureJudgeResult.CONTINUE;
        })

      Column() {
        Text('测试结果')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })
          .alignSelf(ItemAlign.Start)
          .fontColor('#2E2E2E')

        Text(this.testResults)
          .fontSize(14)
          .fontColor(this.testResults.includes('成功') ? '#34C759' : '#333333')
          .textAlign(TextAlign.Start)
          .padding(15)
          .backgroundColor(this.testResults.includes('成功') ? '#E8F5E8' : '#F0F0F0')
          .borderRadius(8)
          .width('100%')
      }
      .width('90%')
      .alignItems(HorizontalAlign.Start)
      .margin({ bottom: 10 })

      Button('重置测试')
        .fontSize(16)
        .width('60%')
        .height(45)
        .backgroundColor('#FF3B30')
        .borderRadius(8)
        .fontColor(Color.White)
        .onClick(() => {
          this.gestureInfo = '等待获取手势信息...';
          this.tapCount = 0;
          this.currentGestureInfo = null;
          this.testResults = '未开始测试';
          this.buttonClickCount = 0;
          console.info('测试已重置');
        })

      Text('说明：点击按钮触发TapGesture(fingers:2.5)，在onGestureRecognizerJudgeBegin中获取手势信息，验证fingers值为2')
        .fontSize(8)
        .fontColor('#999999')
        .textAlign(TextAlign.Center)
        .fontStyle(FontStyle.Italic)
        .fontWeight(300)
        .margin({
          top: 15,
          bottom: 10,
          left:10,
          right:10
        })
        .padding(5)
        .width('90%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}
