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
class UserProfile {
  @Trace username: string = '';
  @Trace age: number = 0;

  // @Computed修饰get方法
  @Computed
  get userInfo(): string {
    return `用户: ${this.username}, 年龄: ${this.age}`;
  }

  // ========== 错误场景1（已注释）==========
  // 如果取消注释以下代码，会产生编译错误1：
  // "A property decorated by '@Computed' cannot define a set method."
  /*
  set userInfo(value: string) {
    const parts = value.split(',');
    if (parts.length >= 2) {
      this.username = parts[0].replace('用户: ', '').trim();
      this.age = parseInt(parts[1].replace('年龄: ', '').trim());
    }
  }
  */

  // 修复方式：使用不同的方法名
  setUserInfo(value: string) {
    const parts = value.split(',');
    if (parts.length >= 2) {
      this.username = parts[0].replace('用户: ', '').trim();
      this.age = parseInt(parts[1].replace('年龄: ', '').trim());
    }
  }

  // 用于双向绑定的普通属性
  get bindableUsername(): string {
    return this.username;
  }

  set bindableUsername(value: string) {
    this.username = value;
  }
}

@Entry
@ComponentV2
struct ToolchainComputeVerify0030 {
  userProfile: UserProfile = new UserProfile();

  build() {
    Column() {
      Text('@Computed修饰get方法后修饰set方法，并且和双向绑定!!一起使用')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .textAlign(TextAlign.Center)
        .id('ToolchainComputeVerify0030_001')

      Text('测试说明: 验证@Computed的两个编译错误')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('ToolchainComputeVerify0030_002')

      Divider().margin({ bottom: 20 })

      Text('用户信息:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0030_003')

      Text(`用户名: ${this.userProfile.username}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0030_004')

      Text(`年龄: ${this.userProfile.age}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0030_005')

      Text(`${this.userProfile.userInfo}`)
        .fontSize(14)
        .fontColor('#007DFF')
        .margin({ bottom: 20 })
        .id('ToolchainComputeVerify0030_006')

      Divider().margin({ bottom: 20 })

      // ========== 错误场景2（已注释）==========
      // 如果取消注释以下代码，会产生编译错误2：
      // "A property decorated by '@Computed' cannot be used with two-way bind syntax."
      /*
      TextInput({ text: $$this.userProfile.userInfo })
        .width('80%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0030_007')
      */

      // 修复方式：使用普通属性进行双向绑定
      TextInput({ text: $$this.userProfile.bindableUsername, placeholder: '输入用户名' })
        .width('80%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0030_007')

      Text('(使用bindableUsername进行双向绑定)')
        .fontSize(11)
        .fontColor('#999999')
        .margin({ bottom: 20 })
        .id('ToolchainComputeVerify0030_008')

      Button('设置用户名')
        .width('80%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0030_009')
        .onClick(() => {
          this.userProfile.username = 'Alice';
          console.info('[ComputeVerify] Username set to: Alice')
        })

      Button('设置年龄')
        .width('80%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0030_010')
        .onClick(() => {
          this.userProfile.age = 25;
          console.info('[ComputeVerify] Age set to: 25')
        })

      Button('使用setUserInfo方法')
        .width('80%')
        .margin({ bottom: 20 })
        .backgroundColor('#4CAF50')
        .id('ToolchainComputeVerify0030_011')
        .onClick(() => {
          this.userProfile.setUserInfo('用户: Bob, 年龄: 30');
          console.info('[ComputeVerify] User info set via setUserInfo method')
        })

      Divider().margin({ bottom: 20 })

      Divider().margin({ bottom: 20 })

      Text('⚠️ 预期结果1: 编译期报错')
        .fontSize(14)
        .fontColor('#FF0000')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0030_012')

      Text('错误代码:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0030_013')

      Text('@Computed')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 2 })
        .id('ToolchainComputeVerify0030_014')

      Text('get userInfo(): string { ... }')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 2 })
        .id('ToolchainComputeVerify0030_015')

      Text('set userInfo(value: string) { ... }  // ❌')
        .fontSize(11)
        .fontColor('#FF0000')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 8 })
        .id('ToolchainComputeVerify0030_016')

      Text('报错信息: A property decorated by \'@Computed\' cannot define a set method.')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 15 })
        .id('ToolchainComputeVerify0030_017')

      Text('⚠️ 预期结果2: 编译期报错')
        .fontSize(14)
        .fontColor('#FF0000')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0030_018')

      Text('错误代码:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0030_019')

      Text('TextInput({ text: $$this.userProfile.userInfo })  // ❌')
        .fontSize(11)
        .fontColor('#FF0000')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 8 })
        .id('ToolchainComputeVerify0030_020')

      Text('报错信息: A property decorated by \'@Computed\' cannot be used with two-way bind syntax.')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 15 })
        .id('ToolchainComputeVerify0030_021')

      Divider().margin({ top: 15, bottom: 15 })

      Text('✓ 修复后的代码（当前实现）')
        .fontSize(14)
        .fontColor('#4CAF50')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0030_022')

      Text('修复方式1: 去掉setter，使用不同方法名')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0030_023')

      Text('setUserInfo(value: string) { ... }  // ✓')
        .fontSize(11)
        .fontColor('#4CAF50')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0030_024')

      Text('修复方式2: 使用普通属性进行双向绑定')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('ToolchainComputeVerify0030_025')

      Text('TextInput({ text: $$this.userProfile.bindableUsername })  // ✓')
        .fontSize(11)
        .fontColor('#4CAF50')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('ToolchainComputeVerify0030_026')

      Text('说明: 当前代码已按修复方式实现，可以正常编译运行。页面上展示了预期的编译错误信息和修复方式。')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('ToolchainComputeVerify0030_027')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
