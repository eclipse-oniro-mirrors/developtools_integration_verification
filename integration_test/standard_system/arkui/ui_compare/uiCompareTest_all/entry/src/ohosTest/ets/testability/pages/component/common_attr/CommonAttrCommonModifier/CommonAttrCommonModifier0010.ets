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

interface SharedTransitionOption {
  duration: number;
  curve: Curve;
  delay: number;
}

@Entry
@Component
struct CommonAttrCommonModifier0010 {
  @State currentIndex: number = 0
  @State showSecondPage: boolean = false
  
  private sharedTransitionOptions: Array<SharedTransitionOption | null | undefined> = [
    { duration: 800, curve: Curve.Linear, delay: 100 },
    { duration: 100, curve: Curve.Ease, delay: 1000 },
    { duration: 2000, curve: Curve.EaseIn, delay: 100 },
    { duration: 1000, curve: Curve.EaseOut, delay: 0 },
    { duration: 1000, curve: Curve.EaseInOut, delay: 105.6 },
    { duration: 1000, curve: Curve.FastOutSlowIn, delay: -1 },
    { duration: 1000.5, curve: Curve.LinearOutSlowIn, delay: 100 },
    { duration: 1000, curve: Curve.FastOutLinearIn, delay: 100 },
    { duration: 1000, curve: Curve.ExtremeDeceleration, delay: 100 },
    { duration: 1000, curve: Curve.Sharp, delay: 100 },
    { duration: 1000, curve: Curve.Rhythm, delay: 100 },
    { duration: 1000, curve: Curve.Smooth, delay: 100 },
    { duration: 1000, curve: Curve.Friction, delay: 100 },
    { duration: -1, curve: Curve.Linear, delay: 100 },
    null,
    undefined
  ]

  build() {
    Column() {
      Text('SharedTransition Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`Options: ${JSON.stringify(this.sharedTransitionOptions[this.currentIndex])}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      if (!this.showSecondPage) {
        // 第一个页面的组件
        Column() {
          Text('First Page Component')
            .fontSize(18)
            .fontColor(Color.White)
            .backgroundColor(Color.Blue)
            .padding(20)
            .borderRadius(10)
            .sharedTransition('shared_element', this.sharedTransitionOptions[this.currentIndex])
            .id('shared_component_commonmodifier_0010')
        }
        .justifyContent(FlexAlign.Center)
        .height('16.39%')
      } else {
        // 第二个页面的组件
        Column() {
          Text('Second Page Component')
            .fontSize(18)
            .fontColor(Color.White)
            .backgroundColor(Color.Red)
            .padding(20)
            .borderRadius(10)
            .sharedTransition('shared_element', this.sharedTransitionOptions[this.currentIndex])
            .id('shared_component_commonmodifier_0010')
        }
        .justifyContent(FlexAlign.Center)
        .height('16.39%')
      }

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0010')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.sharedTransitionOptions.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0010')
          .margin({ left: 10 })
      }
      .margin({ top: 20, bottom: 20 })

      Button('Toggle Page')
        .onClick(() => {
          this.showSecondPage = !this.showSecondPage
        })
        .id('toggle_page_button_commonmodifier_0010')
        .backgroundColor(Color.Green)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}


