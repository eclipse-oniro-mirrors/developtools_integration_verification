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
struct ActionEventCommonEventFocusAxisEvent15 {
  @State parentTriggerCount: number = 0;
  @State childTriggerCount: number = 0;
  @State parentMessage: string = '父组件未触发';
  @State childMessage: string = '子组件未触发';
  @State lastTriggerTime: string = '';

  build() {
    Column({ space: 10 }) {
      Text('KeyEvent stopPropagation测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
        .backgroundColor('#2196F3')
        .width('90%')
        .fontStyle(FontStyle.Italic)
        .padding(15)
        .borderRadius(8)
        .textAlign(TextAlign.Center)
        .margin({ top: 20 })

      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0170')
        .fontSize(12)
        .fontColor('#666666')
        .width('90%')
        .textAlign(TextAlign.Center)

      Column({ space: 5 }) {
        Text('父组件 Column 状态')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
          .alignSelf(ItemAlign.Start)

        Row({ space: 10 }) {
          Text('触发次数:')
            .fontSize(14)
            .fontColor('#666666')
          Text(`${this.parentTriggerCount}`)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.parentTriggerCount > 0 ? Color.Red : '#999999')
        }

        Text(this.parentMessage)
          .fontSize(14)
          .fontColor(this.parentTriggerCount > 0 ? Color.Red : '#999999')
          .padding(10)
          .backgroundColor(this.parentTriggerCount > 0 ? '#FFEBEE' : '#F5F5F5')
          .borderRadius(6)
          .width('100%')
      }
      .width('90%')
      .padding(15)
      .backgroundColor('#FFFFFF')
      .borderRadius(10)
      .shadow({ radius: 4, color: '#00000020' })
      .border({ width: 3, color: Color.Red })

      Column({ space: 10 }) {
        Text('子组件 Button 状态')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
          .alignSelf(ItemAlign.Start)

        Row({ space: 10 }) {
          Text('触发次数:')
            .fontSize(14)
            .fontColor('#666666')
          Text(`${this.childTriggerCount}`)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.childTriggerCount > 0 ? Color.Green : '#999999')
        }

        Text(this.childMessage)
          .fontSize(14)
          .fontColor(this.childTriggerCount > 0 ? Color.Green : '#999999')
          .padding(10)
          .backgroundColor(this.childTriggerCount > 0 ? '#E8F5E9' : '#F5F5F5')
          .borderRadius(6)
          .width('100%')
      }
      .width('90%')
      .padding(15)
      .backgroundColor('#FFFFFF')
      .borderRadius(10)
      .shadow({ radius: 4, color: '#00000020' })
      .border({ width: 3, color: Color.Green })

      Column({ space: 15 }) {
        Text('父组件区域（红色边框）')
          .fontSize(16)
          .fontColor('#FF5722')
          .fontWeight(FontWeight.Bold)

        Button('子组件按钮\n（点击此按钮获焦并按手柄按键）')
          .fontSize(18)
          .width('80%')
          .height(120)
          .backgroundColor('#4CAF50')
          .borderRadius(12)
          .fontColor(Color.White)
          .id('ActionEventCommonEventFocusAxisEvent15')
          .defaultFocus(true)
          .focusable(true)
          .labelStyle({
            overflow: TextOverflow.Clip,
            maxLines: 3,
            minFontSize: 10,
            maxFontSize: 20,
            font: {
              size: 18,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .onKeyEvent((event: KeyEvent) => {
            if (event) {
              this.childTriggerCount++;
              this.lastTriggerTime = new Date().toLocaleTimeString();
              this.childMessage = `✓ 子组件触发 | keyCode: ${event.keyCode} | type: ${event.type} | 时间: ${this.lastTriggerTime}`;
              console.log(`[Child] KeyEvent triggered - keyCode: ${event.keyCode}, type: ${event.type}, count: ${this.childTriggerCount}`);
              event.stopPropagation();
              console.log(`[Child] stopPropagation called - 事件已阻止冒泡`);
            }
          })

        Text('（绿色边框）')
          .fontSize(14)
          .fontColor('#4CAF50')
      }
      .width('90%')
      .padding(20)
      .backgroundColor('#FFEBEE')
      .borderRadius(12)
      .border({ width: 4, color: Color.Red, style: BorderStyle.Dashed })
      .onKeyEvent((event: KeyEvent) => {
        if (event) {
          this.parentTriggerCount++;
          this.lastTriggerTime = new Date().toLocaleTimeString();
          this.parentMessage = `✗ 父组件触发 | keyCode: ${event.keyCode} | type: ${event.type} | 时间: ${this.lastTriggerTime}`;
          console.log(`[Parent] KeyEvent triggered - keyCode: ${event.keyCode}, type: ${event.type}, count: ${this.parentTriggerCount}`);
        }
      })

      Column({ space: 8 }) {
        Text('测试说明：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
          .alignSelf(ItemAlign.Start)

        Text('1. 子组件Button调用了stopPropagation()')
          .fontSize(12)
          .fontColor('#666666')
          .alignSelf(ItemAlign.Start)

        Text('2. 预期结果：只有子组件触发（绿色计数增加）')
          .fontSize(12)
          .fontColor('#4CAF50')
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('3. 父组件不应触发（红色计数保持为0）')
          .fontSize(12)
          .fontColor('#FF5722')
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('4. 按下手柄按键后观察两个计数器变化')
          .fontSize(12)
          .fontColor('#666666')
          .alignSelf(ItemAlign.Start)
      }
      .width('90%')
      .padding(15)
      .backgroundColor('#FFF9C4')
      .borderRadius(8)
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
    .padding({ bottom: 20 })
  }
}
