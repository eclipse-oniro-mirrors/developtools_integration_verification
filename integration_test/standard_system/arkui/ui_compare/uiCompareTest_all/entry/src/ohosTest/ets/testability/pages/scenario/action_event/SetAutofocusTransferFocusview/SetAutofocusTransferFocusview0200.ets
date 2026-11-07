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
struct SetAutofocusTransferFocusview0200 {
  @State focusLog: string = ''
  @State currentIndex: number = 1
  private swiperController: SwiperController = new SwiperController()

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0200')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('swiper场景测试')
        .id('setautofocustransfer_focusview_0200_swiper_test')
        .width('90%')
        .height(20)

      Text(this.focusLog)
        .id('setautofocustransfer_focusview_0200_log')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ bottom: 5 })

      Swiper(this.swiperController) {
        Column() {
          Text('第一页')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })

          Button('test')
            .id('setautofocustransfer_focusview_0200_test_btn_1')
            .width('80%')
            .height(50)
            .backgroundColor(Color.Pink)
            .defaultFocus(false)
            .focusable(true)
            .onFocus(() => {
              this.focusLog = 'SwiperTest Gain TestFocus'
              console.log('SwiperTest Gain TestFocus')
            })
            .onBlur(() => {
              this.focusLog = 'SwiperTest Lost TestFocus'
              console.log('SwiperTest Lost TestFocus')
            })
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)

        Column() {
          Text('第二页')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })

          Button('test')
            .id('setautofocustransfer_focusview_0200_test_btn_2')
            .width('80%')
            .height(50)
            .backgroundColor(Color.Orange)
            .defaultFocus(false)
            .focusable(true)
            .onFocus(() => {
              this.focusLog = 'SwiperTest Gain TestFocus'
              console.log('SwiperTest Gain TestFocus')
            })
            .onBlur(() => {
              this.focusLog = 'SwiperTest Lost TestFocus'
              console.log('SwiperTest Lost TestFocus')
            })

          Button('showPrevious')
            .id('setautofocustransfer_focusview_0200_show_previous')
            .width('80%')
            .height(50)
            .margin({ top: 10 })
            .onClick(() => {
              this.swiperController.showPrevious()
            })
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)

        Column() {
          Text('第三页')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })

          Button('test')
            .id('setautofocustransfer_focusview_0200_test_btn_3')
            .width('80%')
            .height(50)
            .backgroundColor(Color.Green)
            .defaultFocus(false)
            .focusable(true)
            .onFocus(() => {
              this.focusLog = 'SwiperTest Gain TestFocus'
              console.log('SwiperTest Gain TestFocus')
            })
            .onBlur(() => {
              this.focusLog = 'SwiperTest Lost TestFocus'
              console.log('SwiperTest Lost TestFocus')
            })

          Button('showPrevious')
            .id('setautofocustransfer_focusview_0200_show_previous_3')
            .width('80%')
            .height(50)
            .margin({ top: 10 })
            .onClick(() => {
              this.swiperController.showPrevious()
            })
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      }
      .index(this.currentIndex)
      .loop(false)
      .indicator(true)
      .width('100%')
      .height('70%')
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }
    .width('100%')
    .height('100%')
  }
}

