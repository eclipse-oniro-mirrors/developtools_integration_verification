/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@ComponentV2
struct ChildComponentEventVerify0040 {
  @Param @Require message: string;
  @Param @Require count: number;
  @Event onMessageChange: (msg: string) => void = () => {};
  @Event onCountIncrease: () => void = () => {};

  build() {
    Column() {
      Text('子组件 - @Event和双向绑定同时使用')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('ChildComponentEventVerify0040_001')

      Text(`消息: ${this.message}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('ChildComponentEventVerify0040_002')

      Text(`计数: ${this.count}`)
        .fontSize(14)
        .margin({ bottom: 10 })
        .id('ChildComponentEventVerify0040_003')

      Button('发送新消息')
        .width('100%')
        .margin({ bottom: 10 })
        .id('ChildComponentEventVerify0040_004')
        .onClick(() => {
          this.onMessageChange('来自子组件的消息');
          console.info('[ChildComponent] Message change event triggered')
        })

      Button('请求增加计数')
        .width('100%')
        .id('ChildComponentEventVerify0040_005')
        .onClick(() => {
          this.onCountIncrease();
          console.info('[ChildComponent] Count increase event triggered')
        })

    }
    .padding(15)
    .backgroundColor('#F0F0F0')
    .borderRadius(8)
  }
}

@Entry
@ComponentV2
struct ToolchainEventVerify0040 {
  @Local parentMessage: string = 'Hello';
  @Local parentCount: number = 0;
  @Local statusMsg: string = '等待事件触发';

  build() {
    Column() {
      Text('@Event和双向绑定命名互不影响时同时使用')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .textAlign(TextAlign.Center)
        .id('ToolchainEventVerify0040_001')

      Text('测试说明: 验证@Event和双向绑定使用不同参数名时可以同时使用')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('ToolchainEventVerify0040_002')

      Divider().margin({ bottom: 20 })

      Text('父组件状态:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0040_003')

      Text(`消息: ${this.parentMessage}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('ToolchainEventVerify0040_004')

      Text(`计数: ${this.parentCount}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('ToolchainEventVerify0040_005')

      Text(`事件日志: ${this.statusMsg}`)
        .fontSize(14)
        .fontColor('#007DFF')
        .margin({ bottom: 20 })
        .id('ToolchainEventVerify0040_006')

      Button('父组件修改消息')
        .width('80%')
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0040_007')
        .onClick(() => {
          this.parentMessage = 'Updated from Parent';
          console.info('[ParentComponent] Message updated')
        })

      Button('父组件增加计数')
        .width('80%')
        .margin({ bottom: 20 })
        .id('ToolchainEventVerify0040_008')
        .onClick(() => {
          this.parentCount++;
          console.info('[ParentComponent] Count increased to: ' + this.parentCount)
        })

      Divider().margin({ bottom: 20 })

      Text('子组件:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0040_009')

      ChildComponentEventVerify0040({
        message: this.parentMessage,
        count: this.parentCount,
        onMessageChange: (msg: string) => {
          this.parentMessage = msg;
          this.statusMsg = `消息已更新: ${msg}`;
          console.info('[ParentComponent] Message changed to: ' + msg)
        },
        onCountIncrease: () => {
          this.parentCount++;
          this.statusMsg = `计数已增加: ${this.parentCount}`;
          console.info('[ParentComponent] Count increased to: ' + this.parentCount)
        }
      })

      Divider().margin({ top: 20, bottom: 20 })

      Text('✓ 预期结果: 编译通过')
        .fontSize(14)
        .fontColor('#4CAF50')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0040_010')

      Text('测试场景说明:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainEventVerify0040_011')

      Text('子组件同时使用@Param和@Event，但参数名不同：')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainEventVerify0040_012')

      Text('双向绑定参数:')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('ToolchainEventVerify0040_013')

      Text('• @Param message: string')
        .fontSize(11)
        .fontColor('#4CAF50')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 2 })
        .id('ToolchainEventVerify0040_014')

      Text('• @Param count: number')
        .fontSize(11)
        .fontColor('#4CAF50')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 8 })
        .id('ToolchainEventVerify0040_015')

      Text('事件回调参数:')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('ToolchainEventVerify0040_016')

      Text('• @Event onMessageChange: (msg: string) => void')
        .fontSize(11)
        .fontColor('#4CAF50')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 2 })
        .id('ToolchainEventVerify0040_017')

      Text('• @Event onCountIncrease: () => void')
        .fontSize(11)
        .fontColor('#4CAF50')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0040_018')

      Text('关键点:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainEventVerify0040_019')

      Text('• 双向绑定参数名: message, count')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('ToolchainEventVerify0040_020')

      Text('• 事件回调参数名: onMessageChange, onCountIncrease')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('ToolchainEventVerify0040_021')

      Text('• 参数名不同，避免了命名冲突')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('ToolchainEventVerify0040_022')

      Text('• 可以同时使用，编译正常')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('ToolchainEventVerify0040_023')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
