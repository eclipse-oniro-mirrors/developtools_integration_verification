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
struct ACEActionGestureFingersLimit21 {
  @State pinchCount: number = 0;
  @State message: string = '等待旋转...';
  @State lastFingerCount: number = 0;
  @State buttonColor: Color = Color.Blue;
  @State scaleValue: number = 1;
  @State pinchValue: number = 1;
  @State rotateAngle: number = 0;
  @State rotateValue: number = 0;
  @State pinchX: number = 0;
  @State pinchY: number = 0;

  build() {
    Column({ space: 15 }) {
      Text('RotationGesture 多指测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
        .backgroundColor('#2196F3')
        .width('90%')
        .fontStyle(FontStyle.Italic)
        .padding(12)
        .borderRadius(8)
        .textAlign(TextAlign.Center)
        .margin({ top: 15 })

      Row() {
        Text('fingers: 1 | isFingerCountLimited: true')
          .fontSize(14)
          .fontColor('#FF5722')
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .backgroundColor('#2196F3')
          .width('90%')
          .padding(12)
          .borderRadius(8)
          .textAlign(TextAlign.Center)
          .margin({ top: 15 })
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#FFF3E0')
      .borderRadius(6)
      .justifyContent(FlexAlign.Center)

      Column() {
        Text('旋转角度: ' + this.rotateAngle.toFixed(1) + '°')
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)
          .margin({ bottom: 10 })
        Text('手指中心: (' + this.pinchX.toFixed(0) + ', ' + this.pinchY.toFixed(0) + ')')
          .fontSize(14)
          .fontStyle(FontStyle.Italic)
          .margin({ bottom: 10 })
        Text('旋转次数: ' + this.pinchCount)
          .fontSize(14)
          .fontStyle(FontStyle.Italic)
          .margin({ bottom: 10 })
        Text('当前手指数: ' + this.lastFingerCount)
          .fontSize(14)
          .fontColor(this.buttonColor)
      }
      .id('ACEActionGestureFingersLimit21')
      .width('85%')
      .height('14.75%')
      .backgroundColor(this.buttonColor)
      .borderRadius(10)
      .justifyContent(FlexAlign.Center)
      .rotate({ angle: this.rotateAngle })
      .gesture(
        RotationGesture({ fingers: 1, isFingerCountLimited: true })
          .onActionStart((event: GestureEvent) => {
            console.info('Rotation start')
            if (event) {
              this.pinchCount++;
              // 统计fingerList中非空元素的数量
              let actualFingers = 0;
              for (let i = 0; i < event.fingerList.length; i++) {
                if (event.fingerList[i] !== undefined && event.fingerList[i] !== null) {
                  actualFingers++;
                }
              }
              this.lastFingerCount = actualFingers;

              switch (this.lastFingerCount) {
                case 2:
                  this.buttonColor = Color.Orange;
                  break;
                case 3:
                  this.buttonColor = Color.Green;
                  break;
                case 4:
                  this.buttonColor = Color.Blue;
                  break;
                case 5:
                  this.buttonColor = Color.Pink;
                  break;
                default:
                  this.buttonColor = Color.Gray;
                  break;
              }
              this.message = `第 ${this.pinchCount} 次旋转 | ${this.lastFingerCount} 指\n${this.lastFingerCount === 2 ? ' 触发成功' : ' 未触发'}`;
              console.log(`RotationGesture触发: ${this.lastFingerCount}指, 触发次数: ${this.pinchCount}, fingerList.length: ${event.fingerList.length}, actualFingers: ${actualFingers}`);
            }
          })
          .onActionUpdate((event: GestureEvent) => {
            if (event) {
              this.rotateAngle = this.rotateValue + event.angle;
              // 使用旋转中心点坐标
              if (event.pinchCenterX !== undefined && event.pinchCenterY !== undefined) {
                this.pinchX = event.pinchCenterX;
                this.pinchY = event.pinchCenterY;
              }
            }
          })
          .onActionEnd((event: GestureEvent) => {
            this.rotateValue = this.rotateAngle;
            console.info('Rotation end')
          })
      )

      Text(this.message)
        .fontSize(16)
        .lineHeight(24)
        .padding(12)
        .fontStyle(FontStyle.Italic)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .width('90%')
        .textAlign(TextAlign.Center)


      Column({ space: 8 }) {
        Row() {
          Circle({ width: 16, height: 16 })
            .fill(Color.Gray)
          Text('1指滑动-不触发')
            .fontStyle(FontStyle.Italic)
            .padding(12)
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .margin({ left: 8 })
        }
        .width('48%')

        Row() {
          Circle({ width: 16, height: 16 })
            .fill(Color.Orange)
          Text('2指旋转-触发')
            .fontStyle(FontStyle.Italic)
            .padding(12)
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .margin({ left: 8 })
        }
        .width('48%')

        Row() {
          Circle({ width: 16, height: 16 })
            .fill(Color.Green)
          Text('3指旋转-不触发')
            .fontStyle(FontStyle.Italic)
            .padding(12)
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .margin({ left: 8 })
        }
        .width('48%')
      }
      .width('90%')
      .padding(12)
      .backgroundColor('#FFFFFF')
      .borderRadius(8)
      .shadow({ radius: 2, color: '#00000010' })

      Text('fingers=1, isFingerCountLimited=true\n实际手指数 = 2 即触发旋转')
        .fontSize(11)
        .lineHeight(18)
        .padding(10)
        .backgroundColor('#E3F2FD')
        .borderRadius(6)
        .width('90%')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 15 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
