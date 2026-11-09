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
struct BackwardAnalysisAln1380 {
  @State sliderValue: number = 0
  @State isVisible: boolean = true
  private intervalId: number = -1

  aboutToAppear() {
    // 自动切换slider进度
    this.intervalId = setInterval(() => {
      this.sliderValue = (this.sliderValue + 10) % 110
    }, 500)
  }

  aboutToDisappear() {
    if (this.intervalId !== -1) {
      clearInterval(this.intervalId)
    }
  }

  build() {
    Column() {
      Text('验证visualAbility参数控制显隐')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(`当前进度: ${this.sliderValue}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      // 控制显隐的按钮
      Button(this.isVisible ? '隐藏Slider' : '显示Slider')
        .id('visibility_btn_backwardanalysis_aln_1380')
        .onClick(() => {
          this.isVisible = !this.isVisible
        })
        .margin({ bottom: 20 })

      // Slider组件，通过visualAbility控制显隐
      if (this.isVisible) {
        Slider({
          value: this.sliderValue,
          min: 0,
          max: 100,
          step: 1
        })
          .id('slider_backwardanalysis_aln_1380')
          .width('90%')
          .onChange((value: number) => {
            this.sliderValue = value
          })
      }

      Text(this.isVisible ? 'Slider当前可见' : 'Slider当前隐藏')
        .fontSize(14)
        .fontColor(this.isVisible ? '#00AA00' : '#FF0000')
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}

