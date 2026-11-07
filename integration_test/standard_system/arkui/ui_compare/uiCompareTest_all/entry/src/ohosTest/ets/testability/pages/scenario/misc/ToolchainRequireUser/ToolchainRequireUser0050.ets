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
struct MiddleComponent0050 {
  build() {
    Column() {
      Text('中间层组件')
        .fontSize(14)
        .margin({ bottom: 10 })
        .id('ToolchainRequireUser0050_001')

      // 嵌套子组件，演示跨层级传递
      ChildComponent0050()
    }
    .padding(10)
    .backgroundColor('#e8e8e8')
    .borderRadius(8)
  }
}

@Component
struct ChildComponent0050 {
  @Consume themeColor: string;
  @Consume fontSize: number;

  build() {
    Column() {
      Text('最底层子组件')
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('ToolchainRequireUser0050_002')

      Text(`主题颜色: ${this.themeColor}`)
        .fontSize(this.fontSize)
        .fontColor(this.themeColor)
        .margin({ bottom: 10 })
        .id('ToolchainRequireUser0050_003')

      Button('改变颜色')
        .margin({ top: 10 })
        .id('ToolchainRequireUser0050_004')
        .onClick(() => {
          this.themeColor = this.themeColor === '#FF0000' ? '#00FF00' : '#FF0000'
        })
    }
    .padding(20)
    .backgroundColor('#f0f0f0')
    .borderRadius(8)
  }
}

@Entry
@Component
struct ToolchainRequireUser0050 {
  @Provide themeColor: string = '#FF0000'
  @Provide fontSize: number = 16

  build() {
    Column() {
      Text('@Provide和@Consume一起使用')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('ToolchainRequireUser0050_005')

      Text('父组件(顶层)')
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('ToolchainRequireUser0050_006')

      Text(`当前主题颜色: ${this.themeColor}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('ToolchainRequireUser0050_007')

      Text(`当前字体大小: ${this.fontSize}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .id('ToolchainRequireUser0050_008')

      Button('字体+2')
        .margin({ bottom: 20 })
        .id('ToolchainRequireUser0050_009')
        .onClick(() => {
          this.fontSize += 2
        })

      // 使用中间层组件，演示@Provide/@Consume跨层级传递
      MiddleComponent0050()

      Text('说明: 父组件使用@Provide提供数据，子组件使用@Consume消费数据，实现跨层级传递')
        .fontSize(12)
        .fontColor('#666666')
        .margin({ top: 30 })
        .textAlign(TextAlign.Center)
        .id('ToolchainRequireUser0050_010')

    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
