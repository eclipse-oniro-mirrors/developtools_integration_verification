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
struct AceActionEventGestureComponentId36 {
  @State gestureInfo: string = '长按文本获取组件信息';
  private testId: string = 'longPressTextWithReject';

  build() {
    Column() {
      Text('自定义手势判定 Reject 测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontStyle(FontStyle.Italic)
        .padding(15)
        .backgroundColor('#E3F2FD')
        .borderRadius(8)
        .width('90%')
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .textAlign(TextAlign.Center)
        .margin({ top: 20 })

      Divider()
        .width('90%')
        .color('#E0E0E0')
        .margin({ top: 5, bottom: 5 })

      Column({ space: 10 }) {
        Text('组件 ID 信息')
          .fontSize(10)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text(this.testId)
          .fontSize(10)
          .lineHeight(16)
          .padding(10)
          .backgroundColor('#FFF3E0')
          .borderRadius(6)
          .copyOption(CopyOptions.InApp)
          .width('100%')
          .fontFamily('monospace')
          .wordBreak(WordBreak.BREAK_ALL)
      }
      .width('90%')
      .padding(15)
      .backgroundColor('#FFFFFF')
      .borderRadius(8)
      .shadow({ radius: 4, color: '#00000020' })
      .margin({ top: 10 })

      Text('长按我（手势判定CONTINUE）')
        .id(this.testId)
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('80%')
        .height(80)
        .backgroundColor('#4CAF50')
        .textAlign(TextAlign.Center)
        .borderRadius(8)
        .fontColor(Color.White)
        .margin({ top: 20 })
        .gesture(
          LongPressGesture({ repeat: false, duration: 500 })
            .tag('longPress1')
            .onAction((event?: GestureEvent) => {
              if (event) {
                let targetId = event.target.id ? event.target.id : 'undefined';
                let targetIdLength = event.target.id ? event.target.id.length : 0;
                this.gestureInfo = `LongPress Event:
                fingerList[0].globalX: ${event.fingerList[0].globalX}, globalY: ${event.fingerList[0].globalY};
                fingerList[0].localX: ${event.fingerList[0].localX}, localY: ${event.fingerList[0].localY};
                target: globalPos: (${event.target.area.globalPosition.x}, ${event.target.area.globalPosition.y}),
                width: ${event.target.area.width}, height: ${event.target.area.height},
                position: (${event.target.area.position.x}, ${event.target.area.position.y})
                timestamp: ${event.timestamp}, source: ${event.source},
                id: ${targetId}, id length: ${targetIdLength}, repeat: ${event.repeat}`;

                console.log('=== LongPress 手势事件信息 (CONTINUE) ===');
                console.log('fingerList[0].globalX: ' + event.fingerList[0].globalX);
                console.log('fingerList[0].globalY: ' + event.fingerList[0].globalY);
                console.log('fingerList[0].localX: ' + event.fingerList[0].localX);
                console.log('fingerList[0].localY: ' + event.fingerList[0].localY);
                console.log('target.area.globalPosition.x: ' + event.target.area.globalPosition.x);
                console.log('target.area.globalPosition.y: ' + event.target.area.globalPosition.y);
                console.log('target.area.width: ' + event.target.area.width);
                console.log('target.area.height: ' + event.target.area.height);
                console.log('target.area.position.x: ' + event.target.area.position.x);
                console.log('target.area.position.y: ' + event.target.area.position.y);
                console.log('timestamp: ' + event.timestamp);
                console.log('source: ' + event.source);
                console.log('target.id: ' + targetId);
                console.log('target.id.length: ' + targetIdLength);
                console.log('repeat: ' + event.repeat);
                console.log('==================');
              }
            })
        )
        .onGestureJudgeBegin((gestureInfo: GestureInfo, event: BaseGestureEvent) => {
          console.log('=== onGestureJudgeBegin 回调触发 ===');
          if (gestureInfo.tag) {
            console.log('gestureInfo.tag: ' + gestureInfo.tag.toString());
          }
          console.log('gestureInfo.type: ' + gestureInfo.type.toString());
          console.log('gestureInfo.isSystemGesture: ' + gestureInfo.isSystemGesture);
          console.log('event.pressure: ' + event.pressure);
          console.log('event.fingerList.length: ' + event.fingerList.length);
          console.log('event.timestamp: ' + event.timestamp);
          console.log('event.source: ' + event.source.toString());
          console.log('event.tiltX: ' + event.tiltX);
          console.log('event.tiltY: ' + event.tiltY);
          console.log('event.sourceTool: ' + event.sourceTool.toString());
          if (gestureInfo.type == GestureControl.GestureType.LONG_PRESS_GESTURE) {
            let longPressEvent = event as LongPressGestureEvent;
            console.log('LongPressGestureEvent.repeat: ' + longPressEvent.repeat);
          }
          console.log('返回 GestureJudgeResult.Reject - 手势不正常响应');
          console.log('==================');
          return GestureJudgeResult.REJECT;
        })

      Text(this.gestureInfo)
        .fontSize(12)
        .lineHeight(20)
        .padding(15)
        .backgroundColor('#E8F5E9')
        .borderRadius(8)
        .width('90%')
        .fontFamily('monospace')
        .margin({ top: 20 })

      // 说明文字
      Column({ space: 5 }) {
        Text('测试说明')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('1. Text 组件设置了 id: "longPressTextWithReject"\n' +
          '2. 使用 gesture() 绑定了 LongPressGesture，并设置 tag: "longPress1"\n' +
          '3. 使用 onGestureJudgeBegin() 自定义手势判定回调\n' +
          '4. 在回调中返回 GestureJudgeResult.Reject，表示不进行系统判定')
          .fontSize(8)
          .lineHeight(20)
          .padding(10)
          .backgroundColor('#E3F2FD')
          .borderRadius(6)
          .width('100%')
      }
      .width('90%')
      .padding(15)
      .backgroundColor('#FFFFFF')
      .borderRadius(8)
      .shadow({ radius: 4, color: '#00000020' })
      .margin({ top: 20 })

      Column({ space: 10 }) {
        Text('预期效果')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('1、不能响应手势\n' +
          '2、不打印组件的相关信息')
          .fontSize(8)
          .lineHeight(20)
          .padding(10)
          .backgroundColor('#FFF8DC')
          .borderRadius(6)
          .width('100%')
      }
      .width('90%')
      .padding(15)
      .backgroundColor('#FFFFFF')
      .borderRadius(8)
      .shadow({ radius: 4, color: '#00000020' })
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
