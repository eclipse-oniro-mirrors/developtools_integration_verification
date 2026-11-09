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
struct SetAutofocusTransferFocusview0470 {
  @State focusLog: string = ''
  @State currentIndex: number = 0
  private swiperController: SwiperController = new SwiperController()

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0470')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('swiper场景测试')
        .id('setautofocustransfer_focusview_0470_swiper_test')
        .width('90%')
        .height(20)

      Column() {
        Text(this.focusLog)
          .id('setautofocustransfer_focusview_0470_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Swiper(this.swiperController) {
          Column() {
            Text('Page 1')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 20 })

            Button('defaultFocus Button 1')
              .id('setautofocustransfer_focusview_0470_default_focus_1')
              .width('80%')
              .height(50)
              .defaultFocus(true)
              .onFocus(() => {
                this.focusLog = 'Page1_DefaultFocus Gain TestFocus'
                console.log('Page1_DefaultFocus Gain TestFocus')
              })
              .onBlur(() => {
                this.focusLog = 'Page1_DefaultFocus Lost TestFocus'
                console.log('Page1_DefaultFocus Lost TestFocus')
              })
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
          .backgroundColor('#F5F5F5')

          Column() {
            Text('Page 2')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 20 })

            Button('defaultFocus Button 2')
              .id('setautofocustransfer_focusview_0470_default_focus_2')
              .width('80%')
              .height(50)
              .defaultFocus(true)
              .onFocus(() => {
                this.focusLog = 'Page2_DefaultFocus Gain TestFocus'
                console.log('Page2_DefaultFocus Gain TestFocus')
              })
              .onBlur(() => {
                this.focusLog = 'Page2_DefaultFocus Lost TestFocus'
                console.log('Page2_DefaultFocus Lost TestFocus')
              })
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
          .backgroundColor('#E8E8E8')

          Column() {
            Text('Page 3')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 20 })

            Button('defaultFocus Button 3')
              .id('setautofocustransfer_focusview_0470_default_focus_3')
              .width('80%')
              .height(50)
              .defaultFocus(true)
              .onFocus(() => {
                this.focusLog = 'Page3_DefaultFocus Gain TestFocus'
                console.log('Page3_DefaultFocus Gain TestFocus')
              })
              .onBlur(() => {
                this.focusLog = 'Page3_DefaultFocus Lost TestFocus'
                console.log('Page3_DefaultFocus Lost TestFocus')
              })
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
          .backgroundColor('#DCDCDC')
        }
        .index(this.currentIndex)
        .autoPlay(false)
        .indicator(true)
        .loop(true)
        .width('100%')
        .height('50%')
        .onChange((index: number) => {
          this.currentIndex = index
        })

        Row() {
          Button('show previous')
            .id('setautofocustransfer_focusview_0470_show_previous')
            .width('45%')
            .height(50)
            .onClick(() => {
              this.swiperController.showPrevious()
            })

          Button('show next')
            .id('setautofocustransfer_focusview_0470_show_next')
            .width('45%')
            .height(50)
            .onClick(() => {
              this.swiperController.showNext()
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
        .margin({ top: 20 })
      }
      .width('100%')
      .height('90%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}

