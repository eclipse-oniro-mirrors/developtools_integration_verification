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


@ObservedV2
class Person {
  @Trace firstName: string = '';
  @Trace lastName: string = '';

  // @Computed修饰get方法
  @Computed
  get fullName(): string {
    return `${this.firstName} ${this.lastName}`;
  }

  // 修复方式：使用不同的方法名（而不是set fullName）
  // 如果改为 "set fullName(value: string)"，会触发编译错误
  setFullName(value: string) {
    const names = value.split(' ');
    if (names.length >= 2) {
      this.firstName = names[0];
      this.lastName = names[1];
    }
  }
}

@Entry
@ComponentV2
struct ToolchainComputeVerify0010 {
  person: Person = new Person();

  build() {
    Column() {
      Text('@Computed修饰get方法后修饰set方法测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('ToolchainComputeVerify0010_001')

      Text('测试说明: @Computed不能同时修饰get和set方法')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('ToolchainComputeVerify0010_002')

      Divider().margin({ bottom: 20 })

      Text('Person信息:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0010_003')

      Text(`First Name: ${this.person.firstName}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0010_004')

      Text(`Last Name: ${this.person.lastName}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0010_005')

      Text(`Full Name (Computed): ${this.person.fullName}`)
        .fontSize(14)
        .fontColor('#007DFF')
        .margin({ bottom: 20 })
        .id('ToolchainComputeVerify0010_006')

      Divider().margin({ bottom: 20 })

      Button('设置First Name')
        .width('80%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0010_007')
        .onClick(() => {
          this.person.firstName = 'John';
          console.info('[ComputeVerify] First name set to: John')
        })

      Button('设置Last Name')
        .width('80%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0010_008')
        .onClick(() => {
          this.person.lastName = 'Doe';
          console.info('[ComputeVerify] Last name set to: Doe')
        })

      Button('设置Full Name (使用setFullName方法)')
        .width('80%')
        .margin({ bottom: 20 })
        .backgroundColor('#4CAF50')
        .id('ToolchainComputeVerify0010_016')
        .onClick(() => {
          this.person.setFullName('Jane Smith');
          console.info('[ComputeVerify] Full name set to: Jane Smith')
        })

      Divider().margin({ bottom: 20 })

      Text('预期结果验证:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0010_009')

      Text('预期结果1: 编译期报错')
        .fontSize(12)
        .fontColor('#FF0000')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0010_010')

      Text('错误信息: A property decorated by \'@Computed\' cannot define a set method.')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0010_011')

      Text('预期结果2: IDE标红报错')
        .fontSize(12)
        .fontColor('#FF0000')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0010_012')

      Text('修复方式: 去掉@Computed')
        .fontSize(12)
        .fontColor('#4CAF50')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0010_013')

      Text('将set方法上的@Computed装饰器删除，只在get方法上保留@Computed')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0010_014')

      Text('修复后的代码（当前实现）:')
        .fontSize(12)
        .fontColor('#4CAF50')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0010_015')

      Text('• @Computed get fullName() { ... }  ✓')
        .fontSize(11)
        .fontColor('#4CAF50')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('ToolchainComputeVerify0010_016')

      Text('• setFullName(value) { ... }  ✓ (使用不同方法名)')
        .fontSize(11)
        .fontColor('#4CAF50')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0010_017')

      Divider().margin({ top: 20, bottom: 20 })

      Text('说明:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0010_018')

      Text('@Computed装饰的属性不能定义setter。当前代码使用setFullName()方法代替setter，这是修复后的正确实现。')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0010_019')

      Text('如需验证编译错误，将setFullName改为set fullName，即可触发报错。')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('ToolchainComputeVerify0010_020')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
