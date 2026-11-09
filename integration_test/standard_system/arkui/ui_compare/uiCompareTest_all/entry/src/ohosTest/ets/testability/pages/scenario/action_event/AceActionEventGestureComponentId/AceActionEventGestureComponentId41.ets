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
struct AceActionEventGestureComponentId41 {
  @State gestureInfo: string = '长按按钮获取组件信息';
  private testId: string = 'longPressButton41';

  build() {
    Column() {
      Text('组件响应LongPressGesture手势测试')
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

        Text('设置的 ID:')
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

      Button('长按我获取组件信息')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('80%')
        .height(80)
        .backgroundColor('#4CAF50')
        .borderRadius(8)
        .fontColor(Color.White)
        .id(this.testId)
        .margin({ top: 20 })
        .gesture(
          LongPressGesture({ repeat: false, duration: 500 })
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
                id: ${targetId}, id length: ${targetIdLength}`;

                console.log('=== LongPress 手势事件信息 ===');
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
                console.log('设置的 id: ' + this.testId);
                console.log('id 匹配: ' + (targetId === this.testId));
                console.log('==================');
              }
            })
        )

      Text(this.gestureInfo)
        .fontSize(12)
        .lineHeight(20)
        .padding(15)
        .backgroundColor('#E8F5E9')
        .borderRadius(8)
        .width('90%')
        .fontFamily('monospace')
        .margin({ top: 20 })

      Column({ space: 5 }) {
        Text('测试说明')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('1. Button 组件直接设置样式属性（非 Modifier 方式）' +
          '2. Button 组件设置了 id: "longPressButton41"' +
          '3. Button 组件绑定了 LongPressGesture 手势' +
          '4. 长按按钮时，响应手势并获取组件信息' +
          '5. 验证获取到的 id 与设置的 id 一致' +
          '6. 事件信息会在界面和控制台同步显示')
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

        Text('长按绿色按钮后：' +
          '• 按钮响应长按手势' +
          '• 获取到的 id 为 "longPressButton41"（与设置的 id 一致）' +
          '• id.length 为 18' +
          '• area 相关信息正确打印（width、height、globalPosition、position）' +
          '• 手指位置信息正确（globalX/Y、localX/Y）' +
          '• 其他信息正确（timestamp、source）' +
          '• 事件信息显示在下方的文本框中' +
          '• 控制台显示 "id 匹配: true"')
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
      .margin({ top: 20, bottom: 40 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
