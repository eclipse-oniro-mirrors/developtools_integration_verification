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
struct ProgressModifierColor0020 {
  @State condition1 : undefined|null|number = 30
  @State condition2 : undefined|null|number = 80
  @State singleColor: ResourceColor = Color.Blue
  @State strokewid : Length = 30

  build() {
    Column() {
      // 1) ProgressOptions.value 置为 -10
      // 2) 通过 contentModifier 传入有效 value: 30
      Progress({
        value: 2,
        total: 80,
        type: ProgressType.Linear })
        .color(this.singleColor)
        .style({strokeWidth:this.strokewid,strokeRadius:15})
        .width(500)
        .height(50)
      
      // 添加环形Progress组件，使用原生方式设置单色切换，strokeWidth改变大小
      Progress({
        value: 30,
        total: 80,
        type: ProgressType.Ring })
        .color(this.singleColor)
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
        .id('ProgressModifierColor0020_001')
        .onClick(() => {
          this.singleColor = Color.Yellow
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
        .id('ProgressModifierColor0020_002')
        .onClick(() => {
          this.singleColor = Color.Red
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
        .id('ProgressModifierColor0020_003')
        .onClick(() => {
          this.singleColor = Color.Green
          this.strokewid = 40
        })
    }
    .width('100%')
    .height('100%')
  }
}
