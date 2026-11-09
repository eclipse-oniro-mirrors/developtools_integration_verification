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

// 全屏模态焦点测试页面组件
@Component
struct ModalFocusPage {
  @State currentFocus: string = '无'
  @State focusHistory: string[] = []

  build() {
    Column() {
      Text('全屏模态焦点测试页面')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('ModalFocusPage_001')

      Text('使用Tab键或方向键进行走焦测试')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('ModalFocusPage_002')

      Text(`当前焦点: ${this.currentFocus}`)
        .fontSize(16)
        .fontColor('#007DFF')
        .margin({ bottom: 20 })
        .id('ModalFocusPage_003')

      // 可获焦的按钮1
      Button('按钮1')
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .id('ModalFocusPage_004')
        .focusable(true)
        .onFocus(() => {
          this.currentFocus = '按钮1'
          this.focusHistory.push('按钮1')
          console.info('[ModalFocusPage] Focus on Button 1')
        })
        .onBlur(() => {
          console.info('[ModalFocusPage] Blur from Button 1')
        })

      // 可获焦的按钮2
      Button('按钮2')
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .id('ModalFocusPage_005')
        .focusable(true)
        .onFocus(() => {
          this.currentFocus = '按钮2'
          this.focusHistory.push('按钮2')
          console.info('[ModalFocusPage] Focus on Button 2')
        })
        .onBlur(() => {
          console.info('[ModalFocusPage] Blur from Button 2')
        })

      // 可获焦的按钮3
      Button('按钮3')
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .id('ModalFocusPage_006')
        .focusable(true)
        .onFocus(() => {
          this.currentFocus = '按钮3'
          this.focusHistory.push('按钮3')
          console.info('[ModalFocusPage] Focus on Button 3')
        })
        .onBlur(() => {
          console.info('[ModalFocusPage] Blur from Button 3')
        })

      // 可获焦的输入框1
      TextInput({ placeholder: '输入框1' })
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .id('ModalFocusPage_007')
        .focusable(true)
        .onFocus(() => {
          this.currentFocus = '输入框1'
          this.focusHistory.push('输入框1')
          console.info('[ModalFocusPage] Focus on TextInput 1')
        })
        .onBlur(() => {
          console.info('[ModalFocusPage] Blur from TextInput 1')
        })

      // 可获焦的输入框2
      TextInput({ placeholder: '输入框2' })
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .id('ModalFocusPage_008')
        .focusable(true)
        .onFocus(() => {
          this.currentFocus = '输入框2'
          this.focusHistory.push('输入框2')
          console.info('[ModalFocusPage] Focus on TextInput 2')
        })
        .onBlur(() => {
          console.info('[ModalFocusPage] Blur from TextInput 2')
        })

      // 可获焦的按钮4
      Button('按钮4')
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .id('ModalFocusPage_009')
        .focusable(true)
        .onFocus(() => {
          this.currentFocus = '按钮4'
          this.focusHistory.push('按钮4')
          console.info('[ModalFocusPage] Focus on Button 4')
        })
        .onBlur(() => {
          console.info('[ModalFocusPage] Blur from Button 4')
        })

      Divider().margin({ top: 10, bottom: 10 })

      Text('焦点历史:')
        .fontSize(12)
        .fontColor('#666666')
        .margin({ bottom: 5 })
        .id('ModalFocusPage_010')

      Text(this.focusHistory.join(' → '))
        .fontSize(11)
        .fontColor('#999999')
        .textAlign(TextAlign.Center)
        .width('90%')
        .id('ModalFocusPage_011')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
    .alignItems(HorizontalAlign.Center)
  }
}

@Entry
@Component
struct SpecialComponentsFullscreenLaunchComponentEvent0010084895384 {
  @State isShowModal: boolean = false

  // 全屏模态转场样式
  @Builder
  myBuilder() {
    ModalFocusPage()
  }

  build() {
    Column() {
      Text('全屏模态拉起原子化服务焦点事件测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010084895384_001')

      Text('测试说明: 测试全屏模态中的焦点切换')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010084895384_002')

      // 进入全屏模态焦点测试按钮
      Button('进入全屏模态焦点测试')
        .width('80%')
        .height(50)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010084895384_003')
        .onClick(() => {
          this.isShowModal = true
          console.info('[FullscreenLaunchFocus] Opening fullscreen modal for focus test')
        })

      Text('测试步骤:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 30, bottom: 10 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010084895384_004')

      Text('1. 点击"进入全屏模态焦点测试"按钮')
        .fontSize(12)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010084895384_005')

      Text('2. 按Tab键进行走焦')
        .fontSize(12)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010084895384_006')

      Text('3. 按方向键进行走焦')
        .fontSize(12)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010084895384_007')

      Divider().margin({ top: 20, bottom: 20 })

      Text('预期结果:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010084895384_008')

      Text('• Tab键: 自动由上至下走焦')
        .fontSize(12)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010084895384_009')

      Text('• 方向键: 自由走焦')
        .fontSize(12)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('SpecialComponentsFullscreenLaunchComponentEvent0010084895384_010')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
    .bindContentCover(this.isShowModal, this.myBuilder(), {
      modalTransition: ModalTransition.DEFAULT,
      backgroundColor: Color.White,
      onAppear: () => {
        console.info('[FullscreenLaunchFocus] Modal appeared')
      },
      onDisappear: () => {
        console.info('[FullscreenLaunchFocus] Modal disappeared')
        this.isShowModal = false
      }
    })
  }
}
