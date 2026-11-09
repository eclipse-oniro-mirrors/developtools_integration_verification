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
struct SpecificationsTransition0550 {
  @State selectedDuration: number = 2000
  @State selectedTransition: TransitionEffect = TransitionEffect.OPACITY
  @State showDialog: boolean = false

  aboutToAppear() {
    setTimeout(() => {
      this.showActionSheet()
    }, 500)
  }

  showActionSheet() {
    ActionSheet.show({
      title: 'ActionSheet测试',
      message: '这是一个测试ActionSheet动画的弹窗',
      autoCancel: true,
      alignment: DialogAlignment.Bottom,
      showInSubWindow: false,
      isModal: true,
      transition: this.selectedTransition,
      sheets: [
        {
          title: '选项1',
          action: () => {
            console.info('ActionSheet option 1 clicked')
          }
        },
        {
          title: '选项2',
          action: () => {
            console.info('ActionSheet option 2 clicked')
          }
        }
      ],
      cancel: () => {
        console.info('ActionSheet cancelled')
      }
    })
  }

  build() {
    Column() {
      Text('ActionSheet动画测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 30 })

      Text('Duration设置')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 10 })

      Button('iter_Duration_2000')
        .id('iter_duration_2000')
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

      Button('Duration_2000_Opacity')
        .id('button_duration_2000_opacity')
        .fontSize(16)
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.selectedTransition = TransitionEffect.OPACITY
          console.info('Transition set to Opacity')
        })

      Divider()
        .strokeWidth(2)
        .color(Color.Gray)
        .margin({ top: 20, bottom: 20 })

      Button('ActionSheet: autoCancel_True')
        .id('button_action_sheet_auto_cancel_true')
        .fontSize(18)
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .onClick(() => {
          this.showActionSheet()
        })

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(20)
  }
}
