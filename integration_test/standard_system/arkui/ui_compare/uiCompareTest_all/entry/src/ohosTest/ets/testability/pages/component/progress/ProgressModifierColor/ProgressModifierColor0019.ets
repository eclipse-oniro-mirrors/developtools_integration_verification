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

@Entry
@Component
struct ProgressModifierColor0019 {
  @State condition1 : undefined|null|number = 30
  @State condition2 : undefined|null|number = 80
  @State singleColor: ResourceColor = Color.Blue
  @State gradientColor: LinearGradient = new LinearGradient([{ color: '#ff0000', offset: 0 }, { color: '#0000ff', offset: 1 }])
  @State isGradient: boolean = false
  @State strokewid : Length = 30

  build() {
    Column() {
      // 1) ProgressOptions.value 置为 -10
      // 2) 通过 contentModifier 传入有效 value: 30
      Progress({
        value: 2,
        total: 80,
        type: ProgressType.Ring })
        .color(this.isGradient ? this.gradientColor : this.singleColor)
        .style({strokeWidth:this.strokewid})
        .width(500)
        .height(50)
      
      // 添加环形Progress组件，使用原生方式设置渐变色单色相互切换，strokeWidth改变大小
      Progress({
        value: 30,
        total: 80,
        type: ProgressType.Ring })
        .color(this.isGradient ? this.gradientColor : this.singleColor)
        .style({strokeWidth:this.strokewid})
        .width(200)
        .height(200)
        .margin({top: 20})
      
      Button('change1')
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(100)
        .margin({
          top:200,
          left:0,
          right:0,
          bottom:10
        })
        .id('ProgressModifierColor0019_001')
        .onClick(() => {
          this.isGradient = true   // 設置為漸變色模式
          this.singleColor = Color.Yellow
          this.gradientColor = new LinearGradient([{ color: '#00ff00', offset: 0 }, { color: '#ff00ff', offset: 1 }])
          this.strokewid = 50
        })
      Button('chang2')
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(100)
        .margin({
          top:10,
          left:0,
          right:0,
          bottom:0
        })
        .id('ProgressModifierColor0019_002')
        .onClick(() => {
          this.isGradient = false  // 設置為單色模式
          this.singleColor = Color.Red
          this.gradientColor = new LinearGradient([{ color: '#ff8800', offset: 0 }, { color: '#8800ff', offset: 1 }])
          this.strokewid = 15
        })
      
      // 添加新按钮，同时切换组件颜色和strokeWidth
      Button('同时切换')
        .borderRadius(8)
        .backgroundColor(0xff6b35)
        .width(120)
        .margin({
          top:20,
          left:0,
          right:0,
          bottom:0
        })
        .id('ProgressModifierColor0019_003')
        .onClick(() => {
          this.isGradient = true   // 設置為漸變色模式
          this.singleColor = Color.Green
          this.gradientColor = new LinearGradient([{ color: '#ffff00', offset: 0 }, { color: '#00ffff', offset: 1 }])
          this.strokewid = 40
        })
    }
    .width('100%')
    .height('100%')
  }
}
