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

class ColumnModifier43 implements AttributeModifier<ColumnAttribute> {
  private testId: string = 'rotationGestureColumn43';

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance.id(this.testId);
    instance.width(150);
    instance.height(150);
    instance.backgroundColor('#4CAF50');
    instance.borderRadius(20);
    instance.justifyContent(FlexAlign.Center);
  }
}

@Entry
@Component
struct AceActionEventGestureComponentId43 {
  @State gestureInfo: string = '双指旋转获取组件信息';
  @State angle: number = 0;
  @State rotateValue: number = 0;
  private testId: string = 'rotationGestureColumn43';
  private modifier: ColumnModifier43 = new ColumnModifier43();

  build() {
    Column() {
      Text('Modifier-组件响应RotationGesture手势测试')
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

      Column() {
        Text('双指旋转我')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)

        Text('当前角度: ' + this.angle.toFixed(2) + '°')
          .fontSize(14)
          .fontColor(Color.White)
          .margin({ top: 10 })
      }
      .attributeModifier(this.modifier)
      .margin({ top: 5 })
      .rotate({ angle: this.angle })
      .gesture(
        RotationGesture({ fingers: 2, angle: 1 })
          .onActionStart((event: GestureEvent) => {
            if (event) {
              let targetId = event.target.id ? event.target.id : 'undefined';
              let targetIdLength = event.target.id ? event.target.id.length : 0;
              this.gestureInfo = `RotationGesture Start:
              angle: ${event.angle}
              fingerList[0].globalX: ${event.fingerList[0].globalX}, globalY: ${event.fingerList[0].globalY};
              fingerList[0].localX: ${event.fingerList[0].localX}, localY: ${event.fingerList[0].localY};
              fingerList[1].globalX: ${event.fingerList[1].globalX}, globalY: ${event.fingerList[1].globalY};
              fingerList[1].localX: ${event.fingerList[1].localX}, localY: ${event.fingerList[1].localY};
              target: globalPos: (${event.target.area.globalPosition.x}, ${event.target.area.globalPosition.y}),
              width: ${event.target.area.width}, height: ${event.target.area.height},
              position: (${event.target.area.position.x}, ${event.target.area.position.y})
              timestamp: ${event.timestamp}, source: ${event.source},
              id: ${targetId}, id length: ${targetIdLength}`;

              console.log('=== RotationGesture Start (Modifier方式) ===');
              console.log('event.angle: ' + event.angle);
              console.log('fingerList[0].globalX: ' + event.fingerList[0].globalX);
              console.log('fingerList[0].globalY: ' + event.fingerList[0].globalY);
              console.log('fingerList[0].localX: ' + event.fingerList[0].localX);
              console.log('fingerList[0].localY: ' + event.fingerList[0].localY);
              console.log('fingerList[1].globalX: ' + event.fingerList[1].globalX);
              console.log('fingerList[1].globalY: ' + event.fingerList[1].globalY);
              console.log('fingerList[1].localX: ' + event.fingerList[1].localX);
              console.log('fingerList[1].localY: ' + event.fingerList[1].localY);
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
          .onActionUpdate((event: GestureEvent) => {
            if (event) {
              this.angle = this.rotateValue + event.angle;
              console.log('=== RotationGesture Update ===');
              console.log('event.angle: ' + event.angle);
              console.log('current angle: ' + this.angle);
            }
          })
          .onActionEnd((event: GestureEvent) => {
            if (event) {
              this.rotateValue = this.angle;
              let targetId = event.target.id ? event.target.id : 'undefined';
              console.log('=== RotationGesture End (Modifier方式) ===');
              console.log('final angle: ' + this.angle);
              console.log('target.id: ' + targetId);
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

        Text('1. Column 组件使用 attributeModifier 动态设置样式（Modifier 方式）' +
          '2. ColumnModifier43 中设置了 id: "rotationGestureColumn43"' +
          '3. Column 组件绑定了 RotationGesture 手势（需要 2 指，最小角度变化 1 度）' +
          '4. 双指旋转组件时，响应手势并获取组件信息' +
          '5. onActionStart: 手势开始时触发，打印初始状态' +
          '6. onActionUpdate: 手势移动时触发，实时更新旋转角度' +
          '7. onActionEnd: 手势结束时触发，保存最终角度' +
          '8. 验证获取到的 id 与 Modifier 中设置的 id 一致' +
          '9. 事件信息会在界面和控制台同步显示')
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

        Text('双指旋转绿色方块后：' +
          '• 方块响应旋转手势，跟随手指旋转' +
          '• onActionStart 触发，获取到的 id 为 "rotationGestureColumn43"' +
          '• id.length 为 24' +
          '• 打印两个手指的位置信息（fingerList[0] 和 fingerList[1]）' +
          '• area 相关信息正确打印（width: 300, height: 300, globalPosition、position）' +
          '• onActionUpdate 持续触发，实时更新旋转角度' +
          '• 方块角度显示随旋转实时变化' +
          '• onActionEnd 触发，保存最终旋转角度' +
          '• 控制台显示 "id 匹配: true"' +
          '• 控制台标注为 "(Modifier方式)"')
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
