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
struct CommonAttrCommonModifier1790 {
  @State currentIndex: number = 0
  @State isShow: boolean = true

  build() {
    Column() {
      Text('Transition Test (Asymmetric Duration 400)')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Column() {
        if (this.isShow) {
          Text('Test Component')
            .fontSize(18)
            .width(200)
            .height(100)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.Green)
            .fontColor(Color.White)
            .transition(TransitionEffect.asymmetric(
              TransitionEffect.OPACITY.animation({ duration: 500 }).combine(
                TransitionEffect.rotate({ z: 1, angle: 100 }).animation({ delay: 400, duration: 500 })),
              TransitionEffect.OPACITY.animation({ delay: 400, duration: 500 }).combine(
                TransitionEffect.rotate({ z: 1, angle: 100 }).animation({ duration: 500 }))
            ))
            .id('transition_component_commonmodifier_1790')
        }
      }
      .justifyContent(FlexAlign.Center)
      .height('16.39%')
      .margin({ bottom: 20 })

      Button('Toggle')
        .onClick(() => {
          this.isShow = !this.isShow
        })
        .id('toggle_button_commonmodifier_1790')
        .margin({ bottom: 20 })

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_1790')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < 0) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_1790')
          .margin({ left: 10 })
      }
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}

