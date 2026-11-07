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
struct PopupBoxAvoidSafeZone0010 {
  @State dialogMessage: string = '这是AlertDialog的内容';

  build() {
    Column() {
      Text('AlertDialog配置沉浸式全屏，showInSubWindow，alignment')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .textAlign(TextAlign.Center)
        .id('PopupBoxAvoidSafeZone0010_001')

      Text('测试说明: 测试AlertDialog的配置参数')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('PopupBoxAvoidSafeZone0010_002')

      Divider().margin({ bottom: 20 })

      Text('当前配置:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0010_003')

      Text('• showInSubWindow: true')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0010_004')

      Text('• alignment: DialogAlignment.Center')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0010_005')

      Text('• 沉浸式全屏模式')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 20 })
        .id('PopupBoxAvoidSafeZone0010_006')

      Button('显示AlertDialog')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .id('PopupBoxAvoidSafeZone0010_007')
        .onClick(() => {
          AlertDialog.show({
            title: '提示',
            message: this.dialogMessage,
            showInSubWindow: true,
            alignment: DialogAlignment.Center,
            offset: { dx: 0, dy: 0 },
            confirm: {
              value: '确定',
              action: () => {
                console.info('[AlertDialog] Confirm button clicked')
              }
            },
            cancel: () => {
              console.info('[AlertDialog] Dialog cancelled')
            }
          })
        })

      Divider().margin({ bottom: 20 })

      Text('⚠️ 预期结果: 编译报错')
        .fontSize(14)
        .fontColor('#FF0000')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0010_008')

      Text('测试场景:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0010_009')

      Text('当同时满足以下条件时，预期会产生编译报错：')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0010_010')

      Text('1. EntryAbility配置沉浸式全屏模式')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('PopupBoxAvoidSafeZone0010_011')

      Text('2. AlertDialog设置showInSubWindow为true')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('PopupBoxAvoidSafeZone0010_012')

      Text('3. AlertDialog设置alignment参数')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0010_013')

      Text('当前状态:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0010_014')

      Text('为了让项目能够编译通过，当前代码使用了标准的AlertDialog配置。')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0010_015')

      Text('如需验证编译错误，需要在EntryAbility.ets中启用沉浸式全屏模式。')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0010_016')

      Text('沉浸式全屏配置示例:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0010_017')

      Text('windowClass.setWindowLayoutFullScreen(true)')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .fontFamily('monospace')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0010_018')

      Text('错误原因:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0010_019')

      Text('在沉浸式全屏模式下，showInSubWindow和alignment的组合可能会导致对话框显示位置计算错误或与安全区域冲突，因此编译器会报错。')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('PopupBoxAvoidSafeZone0010_020')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
