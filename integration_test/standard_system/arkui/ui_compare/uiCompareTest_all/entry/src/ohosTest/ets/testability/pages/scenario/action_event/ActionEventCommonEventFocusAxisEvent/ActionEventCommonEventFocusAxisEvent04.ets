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
struct ActionEventCommonEventFocusAxisEvent04 {
  @State message: string = '等待手柄按键...';
  @State keySource: number = -1;
  @State keyCode: number = -1;
  @State pressCount: number = 0;
  @State buttonColor: Color = Color.Blue;

  build() {
    Column({ space: 20 }) {
      Text('手柄KeyEvent测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
        .backgroundColor('#2196F3')
        .width('90%')
        .fontStyle(FontStyle.Italic)
        .padding(15)
        .borderRadius(8)
        .textAlign(TextAlign.Center)
        .margin({
          top: 20 ,
          left:10,
          right:10,
          bottom:20
        })

      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0130')
        .fontSize(12)
        .fontColor('#666666')
        .width('90%')
        .textAlign(TextAlign.Center)

      Button('按下手柄按键测试')
        .fontSize(20)
        .width('85%')
        .height(200)
        .backgroundColor(this.buttonColor)
        .borderRadius(12)
        .fontColor(Color.White)
        .id('ActionEventCommonEventFocusAxisEvent04')
        .margin({ top: 20 })
        .defaultFocus(true)
        .focusable(true)
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
        .onKeyEvent((event: KeyEvent) => {
          if (event) {
            this.keySource = event.keySource;
            this.keyCode = event.keyCode;
            
            if (event.type === KeyType.Down) {
              this.pressCount++;
              this.buttonColor = Color.Green;
            } else if (event.type === KeyType.Up) {
              this.buttonColor = Color.Orange;
            }
            this.message = `设备类型 keySource: ${event.keySource}\n按键码: ${event.keyCode}\n触发次数: ${this.pressCount}`;
            console.log(`[KeyEvent-keySource] keySource: ${event.keySource}, keyCode: ${this.keyCode}, count: ${this.pressCount}`);
          }
        })

      Column({ space: 15 }) {
        Text('设备类型信息')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
          .alignSelf(ItemAlign.Start)
          .margin({ left: 20 })

        Text(this.message)
          .fontSize(16)
          .lineHeight(28)
          .padding(20)
          .fontStyle(FontStyle.Normal)
          .backgroundColor('#F5F5F5')
          .borderRadius(8)
          .width('100%')
          .textAlign(TextAlign.Start)
          .border({ width: 2, color: '#E0E0E0' })
      }
      .width('90%')
      .padding(15)
      .backgroundColor('#FFFFFF')
      .borderRadius(10)
      .shadow({ radius: 4, color: '#00000020' })

      Column({ space: 10 }) {
        Row() {
          Circle({ width: 12, height: 12 })
            .fill(Color.Blue)
          Text('初始状态')
            .fontSize(12)
            .fontColor('#999999')
            .textAlign(TextAlign.Center)
            .fontStyle(FontStyle.Italic)
            .width('90%')
            .padding(10)
            .lineHeight(20)
            .margin({ left: 1 })
        }
        .width('100%')

        Row() {
          Circle({ width: 12, height: 12 })
            .fill(Color.Green)
          Text('按键按下')
            .fontSize(12)
            .fontColor('#999999')
            .textAlign(TextAlign.Center)
            .fontStyle(FontStyle.Italic)
            .width('90%')
            .padding(10)
            .lineHeight(20)
            .margin({ left: 1 })
        }
        .width('100%')

        Row() {
          Circle({ width: 12, height: 12 })
            .fill(Color.Orange)
          Text('按键抬起')
            .fontSize(12)
            .fontColor('#999999')
            .textAlign(TextAlign.Center)
            .fontStyle(FontStyle.Italic)
            .width('90%')
            .padding(10)
            .lineHeight(20)
            .margin({ left: 1 })
        }
        .width('100%')
      }
      .width('90%')
      .padding(15)
      .backgroundColor('#FAFAFA')
      .borderRadius(8)

      Text('说明：使用手柄按键触发KeyEvent事件，打印设备类型')
        .fontSize(12)
        .fontColor('#999999')
        .textAlign(TextAlign.Center)
        .fontStyle(FontStyle.Italic)
        .width('90%')
        .padding(10)
        .lineHeight(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
    .padding({ bottom: 20 })
  }
}

