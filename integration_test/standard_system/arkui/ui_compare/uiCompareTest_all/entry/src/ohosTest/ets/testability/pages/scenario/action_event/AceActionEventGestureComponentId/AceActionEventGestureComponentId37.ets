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

class ChildTextModifier implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.fontSize(18);
    instance.fontWeight(FontWeight.Medium);
    instance.width('80%');
    instance.height(80);
    instance.backgroundColor('#4CAF50');
    instance.borderRadius(8);
    instance.fontColor(Color.White);
  }
}

@Component
struct ChildComponent {
  @State gestureInfo: string = '长按子组件获取信息';
  private modifier: ChildTextModifier = new ChildTextModifier();

  build() {
    Column() {
      Button('子组件 - 长按我')
        .attributeModifier(this.modifier)
        .gesture(
          LongPressGesture({ repeat: false, duration: 500 })
            .onAction((event?: GestureEvent) => {
              if (event) {
                let targetId = event.target.id ? event.target.id : 'undefined';
                let targetIdLength = event.target.id ? event.target.id.length : 0;
                this.gestureInfo = `LongPress Event (子组件):
                fingerList[0].globalX: ${event.fingerList[0].globalX}, globalY: ${event.fingerList[0].globalY};
                fingerList[0].localX: ${event.fingerList[0].localX}, localY: ${event.fingerList[0].localY};
                target: globalPos: (${event.target.area.globalPosition.x}, ${event.target.area.globalPosition.y}),
                width: ${event.target.area.width}, height: ${event.target.area.height},
                position: (${event.target.area.position.x}, ${event.target.area.position.y})
                timestamp: ${event.timestamp}, source: ${event.source},
                id: ${targetId}, id length: ${targetIdLength}`;
                console.log('=== 子组件 LongPress 手势事件信息 (Modifier方式) ===');
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
    }
    .width('100%')
  }
}

// 父组件
@Entry
@Component
struct AceActionEventGestureComponentId37 {
  build() {
    Column() {
      Text('Modifier-父子组件测试（子组件响应手势）')
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
        Text('测试结构')
          .fontSize(10)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('父组件（Index）\n' +
          '└── 子组件（ChildComponent）\n' +
          '    └── Button（通过 Modifier 设置样式，未设置 id）')
          .fontSize(10)
          .lineHeight(16)
          .padding(10)
          .backgroundColor('#FFF3E0')
          .borderRadius(6)
          .width('100%')
          .fontFamily('monospace')
      }
      .width('90%')
      .padding(15)
      .backgroundColor('#FFFFFF')
      .borderRadius(8)
      .shadow({ radius: 4, color: '#00000020' })
      .margin({ top: 10 })

      ChildComponent()
        .margin({ top: 20 })

      Column({ space: 5 }) {
        Text('测试说明')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('1. 父组件（Index）包含子组件（ChildComponent）\n' +
          '2. 子组件中的 Button 使用 attributeModifier 动态设置样式\n' +
          '3. ChildTextModifier 中不设置 id（instance.id() 未调用）\n' +
          '4. 子组件的 Button 绑定了 LongPressGesture 手势\n' +
          '5. 长按子组件时，子组件响应手势并获取组件信息\n' +
          '6. 事件信息会在子组件区域和控制台同步显示')
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

        Text('长按绿色的子组件后：\n' +
          '• 子组件响应长按手势\n' +
          '• 获取到的 id 为 undefined（因为 Modifier 中未设置 id）\n' +
          '• area 相关信息正确打印（width、height、globalPosition、position）\n' +
          '• 手指位置信息正确（globalX/Y、localX/Y）\n' +
          '• 其他信息正确（timestamp、source）\n' +
          '• 事件信息显示在子组件下方的文本框中')
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

export {}
