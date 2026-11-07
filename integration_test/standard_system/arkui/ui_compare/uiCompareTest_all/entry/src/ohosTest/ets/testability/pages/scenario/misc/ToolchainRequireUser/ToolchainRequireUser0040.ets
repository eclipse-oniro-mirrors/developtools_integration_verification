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

@Component
struct ChildComponent0040 {
  @Require @Prop userName: string;
  @Require @Prop userAge: number;

  build() {
    Column() {
      Text('子组件')
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('ToolchainRequireUser0040_001')

      Text(`用户名: ${this.userName}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('ToolchainRequireUser0040_002')

      Text(`年龄: ${this.userAge}`)
        .fontSize(14)
        .id('ToolchainRequireUser0040_003')
    }
    .padding(20)
    .backgroundColor('#f0f0f0')
    .borderRadius(8)
  }
}

@Entry
@Component
struct ToolchainRequireUser0040 {
  @State name: string = '李四'
  @State age: number = 30

  build() {
    Column() {
      Text('@Require和@Prop一起使用')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('ToolchainRequireUser0040_004')

      Text('父组件')
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('ToolchainRequireUser0040_005')

      Text(`父组件用户: ${this.name}, 年龄: ${this.age}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .id('ToolchainRequireUser0040_006')

      Button('年龄+1')
        .margin({ bottom: 20 })
        .id('ToolchainRequireUser0040_007')
        .onClick(() => {
          this.age++
        })

      // 使用@Require和@Prop装饰的子组件，必须传递userName和userAge参数
      ChildComponent0040({ userName: this.name, userAge: this.age })

      Text('说明: 子组件使用@Require修饰@Prop变量，父组件必须传递参数，否则编译报错')
        .fontSize(12)
        .fontColor('#666666')
        .margin({ top: 30 })
        .textAlign(TextAlign.Center)
        .id('ToolchainRequireUser0040_008')

    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
