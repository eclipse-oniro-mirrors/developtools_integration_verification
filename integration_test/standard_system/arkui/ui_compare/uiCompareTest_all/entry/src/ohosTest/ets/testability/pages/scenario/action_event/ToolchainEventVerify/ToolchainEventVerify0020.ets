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

interface DataInfo {
  value: string;
  count: number;
}

@ComponentV2
struct ChildComponentEventVerify0020 {
  @Event onButtonClick: () => void = () => {};
  @Event onValueSend: (value: string) => void = () => {};
  @Event onDataUpdate: (data: DataInfo) => void = () => {};

  @Local internalValue: string = 'Hello';
  @Local clickCount: number = 0;

  build() {
    Column() {
      Text('子组件 - @Event单独使用')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('ChildComponentEventVerify0020_001')

      Text(`内部值: ${this.internalValue}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('ChildComponentEventVerify0020_002')

      Text(`点击次数: ${this.clickCount}`)
        .fontSize(14)
        .margin({ bottom: 10 })
        .id('ChildComponentEventVerify0020_003')

      Button('触发无参数事件')
        .width('100%')
        .margin({ bottom: 10 })
        .id('ChildComponentEventVerify0020_004')
        .onClick(() => {
          this.clickCount++;
          this.onButtonClick();
          console.info('[ChildComponent] Button clicked, count: ' + this.clickCount)
        })

      Button('发送字符串值')
        .width('100%')
        .margin({ bottom: 10 })
        .id('ChildComponentEventVerify0020_005')
        .onClick(() => {
          this.onValueSend(this.internalValue);
          console.info('[ChildComponent] Value sent: ' + this.internalValue)
        })

      Button('发送对象数据')
        .width('100%')
        .id('ChildComponentEventVerify0020_006')
        .onClick(() => {
          let dataInfo: DataInfo = {
            value: this.internalValue,
            count: this.clickCount
          };
          this.onDataUpdate(dataInfo);
          console.info('[ChildComponent] Data sent')
        })

    }
    .padding(15)
    .backgroundColor('#F0F0F0')
    .borderRadius(8)
  }
}

@Entry
@ComponentV2
struct ToolchainEventVerify0020 {
  @Local statusMsg: string[] = [];

  addLog(message: string) {
    this.statusMsg.push(message);
    if (this.statusMsg.length > 5) {
      this.statusMsg.shift();
    }
  }

  build() {
    Column() {
      Text('@Event单独使用编译正常')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('ToolchainEventVerify0020_001')

      Text('测试说明: 验证@Event装饰器单独使用时可以正常编译')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('ToolchainEventVerify0020_002')

      Divider().margin({ bottom: 20 })

      Text('事件日志:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0020_003')

      Column() {
        ForEach(this.statusMsg, (log: string, index: number) => {
          Text(`${index + 1}. ${log}`)
            .fontSize(12)
            .fontColor('#007DFF')
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 3 })
        })

        if (this.statusMsg.length === 0) {
          Text('(暂无事件)')
            .fontSize(12)
            .fontColor('#999999')
        }
      }
      .width('90%')
      .height('8.2%')
      .padding(10)
      .backgroundColor('#F5F5F5')
      .borderRadius(5)
      .margin({ bottom: 20 })
      .id('ToolchainEventVerify0020_004')

      // 使用子组件，只传递@Event回调
      ChildComponentEventVerify0020({
        onButtonClick: () => {
          this.addLog('接收到按钮点击事件');
          console.info('[ParentComponent] Button click event received')
        },
        onValueSend: (value: string) => {
          this.addLog(`接收到字符串值: ${value}`);
          console.info('[ParentComponent] Value received: ' + value)
        },
        onDataUpdate: (data: DataInfo) => {
          this.addLog(`接收到对象数据: value=${data.value}, count=${data.count}`);
          console.info('[ParentComponent] Data received: value=' + data.value + ', count=' + data.count)
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
        .id('ToolchainEventVerify0020_005')

      Text('测试场景说明:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainEventVerify0020_006')

      Text('子组件中定义了三个@Event装饰的回调函数：')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainEventVerify0020_007')

      Text('• @Event onButtonClick: () => void')
        .fontSize(11)
        .fontColor('#4CAF50')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 2 })
        .id('ToolchainEventVerify0020_008')

      Text('• @Event onValueSend: (value: string) => void')
        .fontSize(11)
        .fontColor('#4CAF50')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 2 })
        .id('ToolchainEventVerify0020_009')

      Text('• @Event onDataUpdate: (data: DataInfo) => void')
        .fontSize(11)
        .fontColor('#4CAF50')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0020_010')

      Text('父组件在使用子组件时，为这些@Event回调提供实现，实现父子组件通信。')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0020_011')

      Text('@Event装饰器特点:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainEventVerify0020_012')

      Text('• 用于子组件向父组件传递事件')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('ToolchainEventVerify0020_013')

      Text('• 可以传递任意类型的参数')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('ToolchainEventVerify0020_014')

      Text('• 单独使用时编译正常')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('ToolchainEventVerify0020_015')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
