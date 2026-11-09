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
struct ChildComponent0020 {
  @Require @BuilderParam customBuilder: () => void;

  build() {
    Column() {
      Text('子组件')
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('ToolchainRequireUser0020_001')

      Text('自定义内容区域:')
        .fontSize(14)
        .margin({ bottom: 10 })
        .id('ToolchainRequireUser0020_002')

      // 调用父组件传递的Builder
      this.customBuilder()
    }
    .padding(20)
    .backgroundColor('#f0f0f0')
    .borderRadius(8)
  }
}

@Entry
@Component
struct ToolchainRequireUser0020 {
  @State counter: number = 0

  @Builder
  myBuilder() {
    Column() {
      Text('这是父组件传递的Builder内容')
        .fontSize(14)
        .fontColor('#007DFF')
        .id('ToolchainRequireUser0020_003')

      Button(`点击次数: ${this.counter}`)
        .margin({ top: 10 })
        .id('ToolchainRequireUser0020_004')
        .onClick(() => {
          this.counter++
        })
    }
    .padding(10)
    .backgroundColor('#e0f0ff')
    .borderRadius(4)
  }

  build() {
    Column() {
      Text('@Require和@BuilderParam一起使用')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('ToolchainRequireUser0020_005')

      Text('父组件')
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('ToolchainRequireUser0020_006')

      // 使用@Require和@BuilderParam装饰的子组件，必须传递customBuilder参数
      ChildComponent0020({ customBuilder: this.myBuilder })

      Text('说明: 子组件使用@Require修饰@BuilderParam变量，父组件必须传递Builder，否则编译报错')
        .fontSize(12)
        .fontColor('#666666')
        .margin({ top: 30 })
        .textAlign(TextAlign.Center)
        .id('ToolchainRequireUser0020_007')

    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
