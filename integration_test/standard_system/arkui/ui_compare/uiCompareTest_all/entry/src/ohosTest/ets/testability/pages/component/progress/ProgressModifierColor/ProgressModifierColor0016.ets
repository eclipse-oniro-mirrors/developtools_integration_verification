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



class LocalProgressModifier implements ContentModifier<ProgressConfiguration> {
  value: number|null|undefined = 30;
  tot: number|null|undefined = 80
  color: LinearGradient = new LinearGradient([{ color: '#deb6fb', offset: 0 }, { color: '#ac49f5', offset: 1 }])
  strokewid: Length = 30

  constructor(value: number|null|undefined,tot:number|null|undefined,color:LinearGradient,strokewid:Length) {
    this.value = value;
    this.tot = tot
    this.color = color
    this.strokewid = strokewid
  }

  applyContent(): WrappedBuilder<[ProgressConfiguration]> {
    return wrapBuilder(circularModifierColor);
  }
}



@Builder
function circularModifierColor(config: ProgressConfiguration) {
    Progress({
      value: (config.contentModifier as LocalProgressModifier).value,
      total: (config.contentModifier as LocalProgressModifier).tot,
      type: ProgressType.Ring })
      .color((config.contentModifier as LocalProgressModifier).color)
      .style({strokeWidth:(config.contentModifier as LocalProgressModifier).strokewid})
      .width('100%')
      .height('100%')
}

@Entry
@Component
struct ProgressModifierColor0016 {
  @State condition1 : undefined|null|number = 30
  @State condition2 : undefined|null|number = 80
  @State gradientColor: LinearGradient = new LinearGradient([{ color: '#deb6fb', offset: 0 }, { color: '#ac49f5', offset: 1 }])
  @State strokewid : Length = 30
  modifier = new LocalProgressModifier(this.condition1,this.condition2,this.gradientColor,this.strokewid);
  @State myModifier: (LocalProgressModifier | undefined) = this.modifier;

  build() {
    Column() {
      // 1) ProgressOptions.value 置为 -10
      // 2) 通过 contentModifier 传入有效 value: 30
      Progress({
        value: 2,
        total: 80,
        type: ProgressType.Linear })
        .contentModifier(this.modifier)
        .color(this.gradientColor)
        .style({strokeWidth:this.strokewid,strokeRadius:15})
        .width(500)
        .height(50)
      
      // 添加环形Progress组件
      Progress({
        value: 30,
        total: 80,
        type: ProgressType.Ring })
        .contentModifier(this.modifier)
        .color(this.gradientColor)
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
        .id('ProgressModifierColor0016_001')
        .onClick(() => {
          this.gradientColor = new LinearGradient([{ color: '#fceb99', offset: 0 }, { color: '#f7ce00', offset: 1 }])
          this.strokewid = 50
          this.modifier = new LocalProgressModifier(this.condition1,this.condition2,this.gradientColor,this.strokewid)
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
        .id('ProgressModifierColor0016_002')
        .onClick(() => {
          this.gradientColor = new LinearGradient([{ color: '#f5b5c2', offset: 0 }, { color: '#e64566', offset: 1 }])
          this.strokewid = 15
          this.modifier = new LocalProgressModifier(this.condition1,this.condition2,this.gradientColor,this.strokewid)
        })
      
      // 添加新按钮，同时切换颜色和strokeWidth
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
        .id('ProgressModifierColor0016_003')
        .onClick(() => {
          this.gradientColor = new LinearGradient([{ color: '#a8e6cf', offset: 0 }, { color: '#1de9b6', offset: 1 }])
          this.strokewid = 40
          this.modifier = new LocalProgressModifier(this.condition1,this.condition2,this.gradientColor,this.strokewid)
        })
    }
    .width('100%')
    .height('100%')
  }
}

export {}