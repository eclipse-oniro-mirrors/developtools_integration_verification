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
struct ACEActionGestureFingersLimit26 {
  @State swipeCount: number = 0;
  @State message: string = '等待快滑...';
  @State lastFingerCount: number = 0;
  @State buttonColor: Color = Color.Blue;
  @State swipeSpeed: number = 0;
  @State swipeAngle: number = 0;

  handleSwipe(event: GestureEvent): void {
    if (event) {
      this.swipeCount++;
      const actualFingers = event.fingerList.length;
      this.lastFingerCount = actualFingers;
      this.swipeSpeed = event.speed;
      this.swipeAngle = event.angle;

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
      this.message = `第 ${this.swipeCount} 次快滑 | ${actualFingers} 指\n速度: ${this.swipeSpeed.toFixed(0)} | 角度: ${this.swipeAngle.toFixed(0)}°`;
      console.log(`SwipeGesture: ${actualFingers}指, 触发次数: ${this.swipeCount}, 速度: ${this.swipeSpeed}, 角度: ${this.swipeAngle}`);
    }
  }

  build() {
    Column({ space: 15 }) {
      Text('SwipeGesture 快滑测试')
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
        Text('fingers: 1 | direction: Vertical | speed: 100')
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

      Button('快滑测试')
        .fontSize(18)
        .width('85%')
        .height(180)
        .backgroundColor(this.buttonColor)
        .borderRadius(10)
        .id('ACEActionGestureFingersLimit26')
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
        .gesture(
          SwipeGesture({  isFingerCountLimited:true })
            .onAction((event: GestureEvent) => {
              this.handleSwipe(event);
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
          Text('1指竖直快滑-触发')
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
          Text('2指竖直快滑-触发')
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
          Text('3指竖直快滑-触发')
            .fontStyle(FontStyle.Italic)
            .padding(12)
            .fontWeight(FontWeight.Bold)
            .fontSize(12)
            .margin({ left: 8 })
        }
        .width('48%')

        Row() {
          Circle({ width: 16, height: 16 })
            .fill(Color.Blue)
          Text('4指竖直快滑-触发')
            .fontStyle(FontStyle.Italic)
            .padding(12)
            .fontWeight(FontWeight.Bold)
            .fontSize(12)
            .margin({ left: 8 })
        }
        .width('48%')
      }
      .width('90%')
      .padding(12)
      .backgroundColor('#FFFFFF')
      .borderRadius(8)
      .shadow({ radius: 2, color: '#00000010' })

      Text('单指快滑即可触发')
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
