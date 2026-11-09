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
struct ACEActionGestureFingersLimit37 {
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  @State positionX: number = 0;
  @State positionY: number = 0;
  @State message: string = '等待拖动...';
  @State lastFingerCount: number = 0;
  @State gestureState: string = 'idle';
  @State buttonColor: Color = Color.Blue;
  @State triggeredFingers: string = ''; // 记录触发过的手指数

  build() {
    Column({ space: 15 }) {
      Text('PanGesture 拖动测试')
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
        Text('fingers: 2 | isFingerCountLimited: true')
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
        Text('拖动区域')
          .fontSize(18)
          .fontColor(Color.White)
      }
      .width('85%')
      .height('14.75%')
      .backgroundColor(this.buttonColor)
      .borderRadius(10)
      .justifyContent(FlexAlign.Center)
      .id('ACEActionGestureFingersLimit37')
      .translate({ x: this.offsetX, y: this.offsetY, z: 0 })
      .gesture(
        PanGesture({ fingers: 2, isFingerCountLimited: true })
          .onActionStart((event: GestureEvent) => {
            this.gestureState = 'start';
            const actualFingers = event.fingerList.length;
            this.lastFingerCount = actualFingers;
            
            // 记录触发的手指数
            if (this.triggeredFingers.indexOf(`${actualFingers}根`) === -1) {
              if (this.triggeredFingers === '') {
                this.triggeredFingers = `触发的手指为${actualFingers}根`;
              } else {
                this.triggeredFingers += ` ${actualFingers}根`;
              }
            }
            
            this.message = `拖动开始 | ${actualFingers} 指`;
            console.log(`PanGesture Start: ${actualFingers}指`);
          })
          .onActionUpdate((event: GestureEvent) => {
            if (event) {
              this.gestureState = 'update';
              const actualFingers = event.fingerList.length;
              this.lastFingerCount = actualFingers;
              this.offsetX = this.positionX + event.offsetX;
              this.offsetY = this.positionY + event.offsetY;
              
              // 记录触发的手指数
              if (this.triggeredFingers.indexOf(`${actualFingers}根`) === -1) {
                if (this.triggeredFingers === '') {
                  this.triggeredFingers = `触发的手指为${actualFingers}根`;
                } else {
                  this.triggeredFingers += ` ${actualFingers}根`;
                }
              }
              
              switch (actualFingers) {
                case 1:
                  this.buttonColor = Color.Red;
                  break;
                case 2:
                  this.buttonColor = Color.Orange;
                  break;
                case 3:
                  this.buttonColor = Color.Green;
                  break;
                case 4:
                  this.buttonColor = Color.Blue;
                  break;
                default:
                  this.buttonColor = Color.Gray;
                  break;
              }
              
              this.message = `拖动中 | ${actualFingers} 指\nX: ${this.offsetX.toFixed(0)} | Y: ${this.offsetY.toFixed(0)}`;
              console.log(`PanGesture Update: ${actualFingers}指, offsetX: ${this.offsetX}, offsetY: ${this.offsetY}`);
            }
          })
          .onActionEnd((event: GestureEvent) => {
            this.gestureState = 'end';
            this.positionX = this.offsetX;
            this.positionY = this.offsetY;
            
            // 复位
            this.offsetX = 0;
            this.offsetY = 0;
            this.positionX = 0;
            this.positionY = 0;
            this.buttonColor = Color.Blue;
            
            this.message = `拖动结束\nX: 0 | Y: 0`;
            console.log('PanGesture End - 复位');
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
            .fill(Color.Red)
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
          Text('2指滑动-触发update')
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

      Text('fingers=2, isFingerCountLimited=true\n1指不触发，2指触发update\n减少为1指触发end并复位')
        .fontSize(11)
        .lineHeight(18)
        .padding(10)
        .backgroundColor('#E3F2FD')
        .borderRadius(6)
        .width('90%')
        .textAlign(TextAlign.Center)

      if (this.triggeredFingers !== '') {
        Text(this.triggeredFingers)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF5722')
          .lineHeight(20)
          .padding(12)
          .backgroundColor('#FFF3E0')
          .borderRadius(6)
          .width('90%')
          .textAlign(TextAlign.Center)
          .margin({ bottom: 15 })
      } else {
        Text('')
          .margin({ bottom: 15 })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
