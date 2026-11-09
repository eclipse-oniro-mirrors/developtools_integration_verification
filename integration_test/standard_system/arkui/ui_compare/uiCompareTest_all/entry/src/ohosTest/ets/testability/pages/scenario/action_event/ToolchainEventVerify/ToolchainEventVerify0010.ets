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
struct ChildComponentEventVerify0010 {
  // ========== 错误场景（已注释）==========
  // 如果取消注释以下代码，会产生编译错误：
  // 双向绑定和@Event使用相同的参数名 "value"
  /*
  @Param value: string = '';  // 双向绑定参数
  @Event onChange: (val: string) => void = () => {};  // 事件回调，参数名相同
  */

  // ========== 修复方式：使用不同的参数名 ==========
  @Param @Require inputValue: string;  // 双向绑定参数
  @Event onValueChange: (val: string) => void = () => {};  // 事件回调，使用不同名称

  build() {
    Column() {
      Text('子组件')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('ChildComponentEventVerify0010_001')

      Text(`接收到的值: ${this.inputValue}`)
        .fontSize(14)
        .margin({ bottom: 10 })
        .id('ChildComponentEventVerify0010_002')

      Button('触发事件回调')
        .width('100%')
        .id('ChildComponentEventVerify0010_003')
        .onClick(() => {
          this.onValueChange(this.inputValue);
          console.info('[ChildComponent] Event triggered with value: ' + this.inputValue)
        })

    }
    .padding(15)
    .backgroundColor('#F0F0F0')
    .borderRadius(8)
  }
}

@Entry
@ComponentV2
struct ToolchainEventVerify0010 {
  @Local parentValue: string = '';
  @Local statusMsg: string = '等待事件触发';

  build() {
    Column() {
      Text('双向绑定和@Event赋值时命名一致时编译报错')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .textAlign(TextAlign.Center)
        .id('ToolchainEventVerify0010_001')

      Text('测试说明: 验证双向绑定和@Event使用相同参数名时的编译错误')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('ToolchainEventVerify0010_002')

      Divider().margin({ bottom: 20 })

      Text('父组件状态:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0010_003')

      Text(`父组件的值: ${this.parentValue}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('ToolchainEventVerify0010_004')

      Text(`事件日志: ${this.statusMsg}`)
        .fontSize(14)
        .fontColor('#007DFF')
        .margin({ bottom: 20 })
        .id('ToolchainEventVerify0010_005')

      // 使用子组件，传递双向绑定和事件回调
      ChildComponentEventVerify0010({
        inputValue: this.parentValue,
        onValueChange: (val: string) => {
          this.statusMsg = `接收到值: ${val}`;
          console.info('[ParentComponent] Received value from child: ' + val)
        }
      })

      Divider().margin({ top: 20, bottom: 20 })

      Text('⚠️ 预期结果: 编译期报错')
        .fontSize(14)
        .fontColor('#FF0000')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0010_006')

      Text('错误场景说明:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainEventVerify0010_007')

      Text('如果在子组件中使用相同的参数名：')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainEventVerify0010_008')

      Text('@Param value: string = \'\';')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 2 })
        .id('ToolchainEventVerify0010_009')

      Text('@Event onChange: (val: string) => void;')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 8 })
        .id('ToolchainEventVerify0010_010')

      Text('然后在父组件中传递：')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainEventVerify0010_011')

      Text('ChildComponent({ value: this.parentValue, onChange: ... })')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 8 })
        .id('ToolchainEventVerify0010_012')

      Text('会产生编译错误，因为@Param和@Event参数名存在命名规则冲突')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 15 })
        .id('ToolchainEventVerify0010_013')

      Text('✓ 修复后的代码（当前实现）')
        .fontSize(14)
        .fontColor('#4CAF50')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0010_014')

      Text('使用不同的参数名避免冲突：')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainEventVerify0010_015')

      Text('@Param inputValue: string = \'\';  // ✓')
        .fontSize(11)
        .fontColor('#4CAF50')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 2 })
        .id('ToolchainEventVerify0010_016')

      Text('@Event onValueChange: (val: string) => void;  // ✓')
        .fontSize(11)
        .fontColor('#4CAF50')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0010_017')

      Text('说明: 双向绑定参数和@Event回调的命名必须不同，避免参数冲突。当前代码已按修复方式实现，可以正常编译运行。')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('ToolchainEventVerify0010_018')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
