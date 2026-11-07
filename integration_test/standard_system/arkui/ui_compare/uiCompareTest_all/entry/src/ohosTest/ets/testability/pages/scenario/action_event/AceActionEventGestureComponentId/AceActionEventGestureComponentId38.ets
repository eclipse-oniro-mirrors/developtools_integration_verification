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

class ParentColumnModifier02 implements AttributeModifier<ColumnAttribute> {
  applyNormalAttribute(instance: ColumnAttribute): void {
    instance.width('90%');
    instance.height(300);
    instance.backgroundColor('#FF9800');
    instance.borderRadius(12);
    instance.padding(20);
    instance.justifyContent(FlexAlign.SpaceBetween);
  }
}

class ChildButtonModifier02 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.fontSize(16);
    instance.width('60%');
    instance.height(60);
    instance.backgroundColor('#4CAF50');
    instance.borderRadius(8);
    instance.fontColor(Color.White);
  }
}

// 子组件
@Component
struct ChildComponent38 {
  build() {
    Button('子组件区域')
      .attributeModifier(new ChildButtonModifier02())
  }
}

@Entry
@Component
struct AceActionEventGestureComponentId38 {
  @State parentGestureInfo: string = '点击父组件橙色区域（避开子组件）';
  private parentModifier: ParentColumnModifier02 = new ParentColumnModifier02();

  build() {
    Column() {
      Text('Modifier-父子组件测试（父组件响应手势）')
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

      // 父组件 - 橙色区域（绑定点击手势）
      Column() {
        Text('↓ 点击此处（父组件区域）↓')
          .fontSize(14)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)

        ChildComponent38()
        Text('↑ 点击此处（父组件区域）↑')
          .fontSize(14)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
      }
      .attributeModifier(this.parentModifier)
      .margin({ top: 20 })
      .gesture(
        TapGesture()
          .onAction((event?: GestureEvent) => {
            if (event) {
              let targetId = event.target.id ? event.target.id : 'undefined';
              let targetIdLength = event.target.id ? event.target.id.length : 0;
              this.parentGestureInfo = `Tap Event (父组件):
              fingerList[0].globalX: ${event.fingerList[0].globalX}, globalY: ${event.fingerList[0].globalY};
              fingerList[0].localX: ${event.fingerList[0].localX}, localY: ${event.fingerList[0].localY};
              target: globalPos: (${event.target.area.globalPosition.x}, ${event.target.area.globalPosition.y}),
              width: ${event.target.area.width}, height: ${event.target.area.height},
              position: (${event.target.area.position.x}, ${event.target.area.position.y})
              timestamp: ${event.timestamp}, source: ${event.source},
              id: ${targetId}, id length: ${targetIdLength}`;

              console.log('=== 父组件 Tap 手势事件信息 (Modifier方式) ===');
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

      Text(this.parentGestureInfo)
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

        Text('1. 父组件（橙色 Column）使用 attributeModifier 动态设置样式' +
          '2. ParentColumnModifier 中不设置 id（instance.id() 未调用）' +
          '3. 父组件绑定了 TapGesture 点击手势' +
          '4. 子组件（绿色按钮）位于父组件内部' +
          '5. 点击父组件的橙色区域（避开子组件）时，父组件响应手势\n' +
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

        Text('点击父组件橙色区域（避开绿色子组件）后：\n' +
          '• 父组件响应点击手势\n' +
          '• 获取到的 id 为 undefined（因为 Modifier 中未设置 id）\n' +
          '• area 相关信息正确打印（width、height、globalPosition、position）\n' +
          '• 手指位置信息正确（globalX/Y、localX/Y）\n' +
          '• 其他信息正确（timestamp、source）\n' +
          '• 事件信息显示在下方的文本框中\n' +
          '\n' +
          '注意：\n' +
          '• 点击子组件（绿色按钮）时，子组件不会响应（未绑定手势）\n' +
          '• 只有点击父子组件相减的区域（父组件独有区域）才会触发')
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
