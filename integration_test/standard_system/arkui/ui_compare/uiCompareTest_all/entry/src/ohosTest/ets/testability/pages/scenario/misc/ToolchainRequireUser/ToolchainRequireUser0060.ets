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
struct ChildComponent0060 {
  @Require @State counter: number;
  @Require @State message: string;

  build() {
    Column() {
      Text('子组件')
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('ToolchainRequireUser0060_001')

      Text(`消息: ${this.message}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('ToolchainRequireUser0060_002')

      Text(`计数: ${this.counter}`)
        .fontSize(14)
        .margin({ bottom: 10 })
        .id('ToolchainRequireUser0060_003')

      Button('子组件计数+1')
        .margin({ top: 10 })
        .id('ToolchainRequireUser0060_004')
        .onClick(() => {
          this.counter++
        })

      Button('修改消息')
        .margin({ top: 10 })
        .id('ToolchainRequireUser0060_005')
        .onClick(() => {
          this.message = '消息已更新'
        })
    }
    .padding(20)
    .backgroundColor('#f0f0f0')
    .borderRadius(8)
  }
}

@Entry
@Component
struct ToolchainRequireUser0060 {
  @State parentCounter: number = 0
  @State parentMessage: string = '初始消息'

  build() {
    Column() {
      Text('@Require和@State一起使用')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('ToolchainRequireUser0060_006')

      Text('父组件')
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('ToolchainRequireUser0060_007')

      Text(`父组件计数: ${this.parentCounter}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('ToolchainRequireUser0060_008')

      Text(`父组件消息: ${this.parentMessage}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .id('ToolchainRequireUser0060_009')

      Button('父组件计数+1')
        .margin({ bottom: 20 })
        .id('ToolchainRequireUser0060_010')
        .onClick(() => {
          this.parentCounter++
        })

      // 使用@Require和@State装饰的子组件，必须传递counter和message参数
      ChildComponent0060({ counter: this.parentCounter, message: this.parentMessage })

      Text('说明: 子组件使用@Require修饰@State变量，父组件必须传递初始值，否则编译报错')
        .fontSize(12)
        .fontColor('#666666')
        .margin({ top: 30 })
        .textAlign(TextAlign.Center)
        .id('ToolchainRequireUser0060_011')

    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
