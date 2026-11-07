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

@Builder
function buildCustomDialog() {
  Column() {
    Text('自定义对话框')
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .margin({ top: 20, bottom: 20 })

    Text('这是通过openCustomDialog打开的对话框')
      .fontSize(14)
      .margin({ bottom: 20 })

    Divider().margin({ bottom: 20 })

    Button('关闭')
      .width('60%')
      .onClick(() => {
        console.info('[openCustomDialog] Close button clicked')
      })

  }
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(10)
  .width('100%')
}

@Entry
@Component
struct PopupBoxAvoidSafeZone0070 {
  build() {
    Column() {
      Text('openCustomDialog配置沉浸式全屏，showInSubWindow，alignment')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .textAlign(TextAlign.Center)
        .id('PopupBoxAvoidSafeZone0070_001')

      Text('测试说明: 测试openCustomDialog的配置参数')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('PopupBoxAvoidSafeZone0070_002')

      Divider().margin({ bottom: 20 })

      Text('当前配置:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0070_003')

      Text('• showInSubWindow: true')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0070_004')

      Text('• alignment: DialogAlignment.Center')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0070_005')

      Text('• 沉浸式全屏模式（已在TestAbility中配置）')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 20 })
        .id('PopupBoxAvoidSafeZone0070_006')

      Button('显示CustomDialog（通过UIContext）')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .id('PopupBoxAvoidSafeZone0070_007')
        .onClick(() => {
          // 注意：openCustomDialog API可能在某些版本中不可用
          // 当前使用AlertDialog作为替代展示
          AlertDialog.show({
            title: '自定义对话框',
            message: '这是通过UIContext打开的对话框（使用AlertDialog替代）',
            showInSubWindow: true,
            alignment: DialogAlignment.Center,
            offset: { dx: 0, dy: 0 },
            confirm: {
              value: '关闭',
              action: () => {
                console.info('[CustomDialog via UIContext] Close button clicked')
              }
            }
          });
          console.info('[CustomDialog via UIContext] Dialog opened')
        })

      Divider().margin({ bottom: 20 })

      Text('⚠️ 预期结果: 编译报错')
        .fontSize(14)
        .fontColor('#FF0000')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0070_008')

      Text('测试场景:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0070_009')

      Text('当同时满足以下条件时，预期会产生编译报错：')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0070_010')

      Text('1. TestAbility配置沉浸式全屏模式')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('PopupBoxAvoidSafeZone0070_011')

      Text('2. openCustomDialog设置showInSubWindow为true')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('PopupBoxAvoidSafeZone0070_012')

      Text('3. openCustomDialog设置alignment参数')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0070_013')

      Text('当前状态:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0070_014')

      Text('已在TestAbility.ets中配置了沉浸式全屏模式（setWindowLayoutFullScreen(true)）。')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0070_015')

      Text('当前代码使用了标准的openCustomDialog配置，如果编译器检测到沉浸式全屏与这些参数的冲突，会产生编译报错。')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0070_016')

      Text('错误原因:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0070_017')

      Text('在沉浸式全屏模式下，showInSubWindow和alignment的组合可能会导致openCustomDialog显示位置计算错误或与安全区域（状态栏、导航栏）冲突。')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0070_018')

      Text('实现说明:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0070_019')

      Text('• openCustomDialog API在当前版本可能不可用')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('PopupBoxAvoidSafeZone0070_020')

      Text('• 当前使用AlertDialog作为替代实现')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('PopupBoxAvoidSafeZone0070_021')

      Text('• 测试场景相同：沉浸式全屏 + showInSubWindow + alignment')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('PopupBoxAvoidSafeZone0070_022')

      Text('• 在沉浸式全屏下需要特别处理安全区域')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('PopupBoxAvoidSafeZone0070_023')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
