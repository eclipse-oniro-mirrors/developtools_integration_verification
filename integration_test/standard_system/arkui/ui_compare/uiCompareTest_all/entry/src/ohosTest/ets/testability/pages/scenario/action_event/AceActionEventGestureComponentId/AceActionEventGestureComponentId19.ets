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

// 自定义 Modifier 类
class MyButtonModifier19 implements AttributeModifier<ButtonAttribute> {
  private testId: string = '9.99';

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.id(this.testId);
    instance.width(150);
    instance.height(60);
    instance.type(ButtonType.Capsule);
    instance.labelStyle({
      overflow: TextOverflow.Clip,
      maxLines: 1,
      minFontSize: 20,
      maxFontSize: 20,
      font: {
        size: 20,
        weight: FontWeight.Bolder,
        family: 'cursive',
        style: FontStyle.Italic
      }
    });
  }
}

@Entry
@Component
struct AceActionEventGestureComponentId19 {
  @State clickInfo: string = '点击按钮获取组件信息';
  @State modifier: MyButtonModifier19 = new MyButtonModifier19();
  private testId: string = '9.99';

  build() {
    Column() {
      Text('组件ID设置为小数测试（Modifier方式）')
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
        Text('小数 ID 信息')
          .fontSize(10)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('完整 ID (通过Modifier设置):')
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

      Row({ space: 20 }) {
        Button('点击获取\n组件信息')
          .attributeModifier(this.modifier)
          .onClick((event?: ClickEvent) => {
            if (event) {
              let targetId = event.target.id ? event.target.id : 'undefined';
              let targetIdLength = event.target.id ? event.target.id.length : 0;
              this.clickInfo = `Click Point: windowX: ${event.windowX}, windowY: ${event.windowY};
              x: ${event.x}, y: ${event.y}; displayX: ${event.displayX}, displayY: ${event.displayY}
              target: globalPos: (${event.target.area.globalPosition.x}, ${event.target.area.globalPosition.y}),
              width: ${event.target.area.width}, height: ${event.target.area.height},
              position: (${event.target.area.position.x}, ${event.target.area.position.y})
              timestamp: ${event.timestamp}, source: ${event.source}, targetDisplayId: ${event.targetDisplayId},
              id: ${targetId}, id length: ${targetIdLength}`;
              console.log('=== 点击事件信息 (Modifier方式) ===');
              console.log('target.area.globalPosition.x: ' + event.target.area.globalPosition.x);
              console.log('target.area.globalPosition.y: ' + event.target.area.globalPosition.y);
              console.log('target.area.width: ' + event.target.area.width);
              console.log('target.area.height: ' + event.target.area.height);
              console.log('target.area.position.x: ' + event.target.area.position.x);
              console.log('target.area.position.y: ' + event.target.area.position.y);
              console.log('timestamp: ' + event.timestamp);
              console.log('source: ' + event.source);
              console.log('targetDisplayId: ' + event.targetDisplayId);
              console.log('target.id: ' + targetId);
              console.log('target.id.length: ' + targetIdLength);
              console.log('==================');
            }
          }, 20)
      }
      .margin({ top: 20 })

      // 事件信息展示
      Text(this.clickInfo)
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

        Text('1. 使用 attributeModifier 动态设置组件属性\n' +
          '2. 通过自定义 MyButtonModifier 类实现 AttributeModifier 接口\n' +
          '3. 在 applyNormalAttribute 方法中设置小数 id: "9.99"\n' +
          '4. 点击按钮触发 onClick 事件，获取完整的 ClickEvent 信息\n' +
          '5. 事件信息会在界面和控制台同步显示')
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

        Text('点击按钮后：\n' +
          '• 获取到的 id 为 9.99\n' +
          '• area 相关信息正确打印（width、height、globalPosition、position）\n' +
          '• 点击位置信息正确（windowX/Y、x/y、displayX/Y）\n' +
          '• 其他信息正确（timestamp、source、targetDisplayId）')
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

      // 测试步骤
      Column({ space: 10 }) {
        Text('Modifier 优势')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('1. 动态属性设置：支持在属性设置时使用 if/else 语法\n' +
          '2. 多态样式：可根据组件状态设置不同样式\n' +
          '3. 代码复用：同一个 Modifier 可应用于多个组件\n' +
          '4. 状态管理：支持按压态、获焦态、禁用态、选中态等')
          .fontSize(8)
          .lineHeight(20)
          .padding(10)
          .backgroundColor('#E8EAF6')
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
