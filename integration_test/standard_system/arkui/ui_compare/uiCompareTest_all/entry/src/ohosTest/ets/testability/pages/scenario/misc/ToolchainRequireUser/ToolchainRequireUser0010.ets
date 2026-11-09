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
struct ChildComponent0010 {
  @Require @Prop message: string;

  build() {
    Column() {
      Text('子组件')
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('ToolchainRequireUser0010_001')

      Text(`接收到的消息: ${this.message}`)
        .fontSize(14)
        .id('ToolchainRequireUser0010_002')
    }
    .padding(20)
    .backgroundColor('#f0f0f0')
    .borderRadius(8)
  }
}

@Entry
@Component
struct ToolchainRequireUser0010 {
  @State parentMessage: string = 'Hello from Parent'

  build() {
    Column() {
      Text('@Require修饰普通变量测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('ToolchainRequireUser0010_003')

      Text('父组件')
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('ToolchainRequireUser0010_004')

      Text(`父组件消息: ${this.parentMessage}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .id('ToolchainRequireUser0010_005')

      // 使用@Require装饰的子组件，必须传递message参数
      ChildComponent0010({ message: this.parentMessage })

      Text('说明: 子组件使用@Require修饰@Prop变量，父组件必须传递该参数，否则编译报错')
        .fontSize(12)
        .fontColor('#666666')
        .margin({ top: 30 })
        .textAlign(TextAlign.Center)
        .id('ToolchainRequireUser0010_006')

    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}