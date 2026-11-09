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
struct SpecificationsTransition0280 {
  @State selectedDuration: number = 2000
  @State selectedTransition: TransitionEffect = TransitionEffect.asymmetric(TransitionEffect.OPACITY, TransitionEffect.scale({ x: 0, y: 0 }))
  @State showDialog: boolean = false

  aboutToAppear() {
    setTimeout(() => {
      this.showAlertDialog()
    }, 500)
  }

  showAlertDialog() {
    AlertDialog.show({
      title: 'AlertDialog测试',
      message: '这是一个测试AlertDialog动画的弹窗',
      autoCancel: true,
      alignment: DialogAlignment.Center,
      showInSubWindow: false,
      isModal: true,
      transition: this.selectedTransition,
      primaryButton: {
        value: '确认',
        action: () => {
          console.info('AlertDialog primary button clicked')
        }
      },
      secondaryButton: {
        value: '取消',
        action: () => {
          console.info('AlertDialog secondary button clicked')
        }
      },
      cancel: () => {
        console.info('AlertDialog cancelled')
      }
    })
  }

  build() {
    Column() {
      Text('AlertDialog动画测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 30 })

      Text('Duration设置')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 10 })

      Button('playMode_Duration_2000')
        .id('playmode_duration_2000')
        .fontSize(16)
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.selectedDuration = 2000
          console.info('Duration set to 2000ms')
        })
        .backgroundColor(this.selectedDuration === 2000 ? Color.Blue : Color.Gray)

      Divider()
        .strokeWidth(2)
        .color(Color.Gray)
        .margin({ top: 20, bottom: 20 })

      Text('Transition设置')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 10 })

      Button('Duration_2000_Asymmetric')
        .id('button_duration_2000_asymmetric')
        .fontSize(16)
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.selectedTransition = TransitionEffect.asymmetric(TransitionEffect.OPACITY, TransitionEffect.scale({ x: 0, y: 0 }))
          console.info('Transition set to Asymmetric')
        })

      Divider()
        .strokeWidth(2)
        .color(Color.Gray)
        .margin({ top: 20, bottom: 20 })

      Button('AlertDialog: autoCancel_True')
        .id('button_alert_dialog_auto_cancel_true')
        .fontSize(18)
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .onClick(() => {
          this.showAlertDialog()
        })

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(20)
  }
}
