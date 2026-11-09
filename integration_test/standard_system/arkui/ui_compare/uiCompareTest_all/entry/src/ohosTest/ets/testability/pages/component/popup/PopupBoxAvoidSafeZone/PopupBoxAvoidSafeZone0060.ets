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

@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController

  build() {
    Column() {
      Text('自定义对话框')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('这是CustomDialog的内容')
        .fontSize(14)
        .margin({ bottom: 20 })

      Divider().margin({ bottom: 20 })

      Row() {
        Button('取消')
          .width('45%')
          .onClick(() => {
            this.controller.close();
            console.info('[CustomDialog] Cancel button clicked')
          })

        Button('确定')
          .width('45%')
          .onClick(() => {
            this.controller.close();
            console.info('[CustomDialog] Confirm button clicked')
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)

    }
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(10)
  }
}

@Entry
@Component
struct PopupBoxAvoidSafeZone0060 {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample(),
    showInSubWindow: true,
    alignment: DialogAlignment.Center,
    offset: { dx: 0, dy: 0 },
    customStyle: false
  })

  build() {
    Column() {
      Text('CustomDialog配置沉浸式全屏，showInSubWindow，alignment')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .textAlign(TextAlign.Center)
        .id('PopupBoxAvoidSafeZone0060_001')

      Text('测试说明: 测试CustomDialog的配置参数')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('PopupBoxAvoidSafeZone0060_002')

      Divider().margin({ bottom: 20 })

      Text('当前配置:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0060_003')

      Text('• showInSubWindow: true')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0060_004')

      Text('• alignment: DialogAlignment.Center')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0060_005')

      Text('• 沉浸式全屏模式（已在TestAbility中配置）')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 20 })
        .id('PopupBoxAvoidSafeZone0060_006')

      Button('显示CustomDialog')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .id('PopupBoxAvoidSafeZone0060_007')
        .onClick(() => {
          this.dialogController.open();
          console.info('[CustomDialog] Dialog opened')
        })

      Divider().margin({ bottom: 20 })

      Text('⚠️ 预期结果: 编译报错')
        .fontSize(14)
        .fontColor('#FF0000')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0060_008')

      Text('测试场景:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0060_009')

      Text('当同时满足以下条件时，预期会产生编译报错：')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0060_010')

      Text('1. TestAbility配置沉浸式全屏模式')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('PopupBoxAvoidSafeZone0060_011')

      Text('2. CustomDialog设置showInSubWindow为true')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('PopupBoxAvoidSafeZone0060_012')

      Text('3. CustomDialog设置alignment参数')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0060_013')

      Text('当前状态:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0060_014')

      Text('已在TestAbility.ets中配置了沉浸式全屏模式（setWindowLayoutFullScreen(true)）。')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0060_015')

      Text('当前代码使用了标准的CustomDialog配置，如果编译器检测到沉浸式全屏与这些参数的冲突，会产生编译报错。')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0060_016')

      Text('错误原因:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0060_017')

      Text('在沉浸式全屏模式下，showInSubWindow和alignment的组合可能会导致CustomDialog显示位置计算错误或与安全区域（状态栏、导航栏）冲突。')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0060_018')

      Text('CustomDialog特点:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0060_019')

      Text('• 自定义对话框，可以自由定义内容和样式')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('PopupBoxAvoidSafeZone0060_020')

      Text('• 使用@CustomDialog装饰器定义')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('PopupBoxAvoidSafeZone0060_021')

      Text('• 在沉浸式全屏下需要特别处理安全区域')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('PopupBoxAvoidSafeZone0060_022')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}

export {}
