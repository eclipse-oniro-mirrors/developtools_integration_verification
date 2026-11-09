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
struct ChildComponentEventVerify0030 {
  @Param @Require userName: string;
  @Param @Require userAge: number;

  build() {
    Column() {
      Text('子组件 - 双向绑定')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('ChildComponentEventVerify0030_001')

      Text(`接收到的用户名: ${this.userName}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('ChildComponentEventVerify0030_002')

      Text(`接收到的年龄: ${this.userAge}`)
        .fontSize(14)
        .margin({ bottom: 10 })
        .id('ChildComponentEventVerify0030_003')

      Text('说明: 子组件通过@Param接收父组件的双向绑定数据')
        .fontSize(11)
        .fontColor('#999999')
        .textAlign(TextAlign.Center)
        .width('100%')
        .id('ChildComponentEventVerify0030_004')

    }
    .padding(15)
    .backgroundColor('#F0F0F0')
    .borderRadius(8)
  }
}

@Entry
@ComponentV2
struct ToolchainEventVerify0030 {
  @Local userName: string = 'Alice';
  @Local userAge: number = 25;

  build() {
    Column() {
      Text('双向绑定单独使用编译正常')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('ToolchainEventVerify0030_001')

      Text('测试说明: 验证双向绑定单独使用时可以正常编译')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('ToolchainEventVerify0030_002')

      Divider().margin({ bottom: 20 })

      Text('父组件状态:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0030_003')

      Text(`用户名: ${this.userName}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('ToolchainEventVerify0030_004')

      Text(`年龄: ${this.userAge}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .id('ToolchainEventVerify0030_005')

      TextInput({ text: this.userName, placeholder: '输入用户名' })
        .width('80%')
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0030_006')
        .onChange((value: string) => {
          this.userName = value;
          console.info('[ParentComponent] Username changed to: ' + value)
        })

      Button('设置用户名为Bob')
        .width('80%')
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0030_007')
        .onClick(() => {
          this.userName = 'Bob';
          console.info('[ParentComponent] Username set to: Bob')
        })

      Button('增加年龄')
        .width('80%')
        .margin({ bottom: 20 })
        .id('ToolchainEventVerify0030_008')
        .onClick(() => {
          this.userAge++;
          console.info('[ParentComponent] Age increased to: ' + this.userAge)
        })

      Divider().margin({ bottom: 20 })

      Text('使用子组件（双向绑定）:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0030_009')

      ChildComponentEventVerify0030({
        userName: this.userName,
        userAge: this.userAge
      })

      Divider().margin({ top: 20, bottom: 20 })

      Text('✓ 预期结果: 编译通过')
        .fontSize(14)
        .fontColor('#4CAF50')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0030_010')

      Text('测试场景说明:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainEventVerify0030_011')

      Text('父组件通过@Local定义状态变量，子组件通过@Param接收数据。')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainEventVerify0030_012')

      Text('父组件代码:')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('ToolchainEventVerify0030_013')

      Text('@Local userName: string = \'Alice\';')
        .fontSize(11)
        .fontColor('#4CAF50')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 2 })
        .id('ToolchainEventVerify0030_014')

      Text('@Local userAge: number = 25;')
        .fontSize(11)
        .fontColor('#4CAF50')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 8 })
        .id('ToolchainEventVerify0030_015')

      Text('子组件代码:')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('ToolchainEventVerify0030_016')

      Text('@Param @Require userName: string;')
        .fontSize(11)
        .fontColor('#4CAF50')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 2 })
        .id('ToolchainEventVerify0030_017')

      Text('@Param @Require userAge: number;')
        .fontSize(11)
        .fontColor('#4CAF50')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainEventVerify0030_018')

      Text('双向绑定特点:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainEventVerify0030_019')

      Text('• 父组件状态变化，子组件自动更新')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('ToolchainEventVerify0030_020')

      Text('• @Param装饰的属性是只读的')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('ToolchainEventVerify0030_021')

      Text('• 单独使用时编译正常')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('ToolchainEventVerify0030_022')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
