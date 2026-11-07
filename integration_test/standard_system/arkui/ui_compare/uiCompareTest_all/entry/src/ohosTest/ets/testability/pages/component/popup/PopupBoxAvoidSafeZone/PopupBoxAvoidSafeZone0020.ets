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
struct PopupBoxAvoidSafeZone0020 {
  build() {
    Column() {
      Text('ActionSheet配置沉浸式全屏，showInSubWindow，alignment')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .textAlign(TextAlign.Center)
        .id('PopupBoxAvoidSafeZone0020_001')

      Text('测试说明: 测试ActionSheet的配置参数')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('PopupBoxAvoidSafeZone0020_002')

      Divider().margin({ bottom: 20 })

      Text('当前配置:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0020_003')

      Text('• showInSubWindow: true')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0020_004')

      Text('• alignment: DialogAlignment.Bottom')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0020_005')

      Text('• 沉浸式全屏模式（已在TestAbility中配置）')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 20 })
        .id('PopupBoxAvoidSafeZone0020_006')

      Button('显示ActionSheet')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .id('PopupBoxAvoidSafeZone0020_007')
        .onClick(() => {
          ActionSheet.show({
            title: '操作菜单',
            message: '请选择操作',
            showInSubWindow: true,
            alignment: DialogAlignment.Bottom,
            offset: { dx: 0, dy: 0 },
            sheets: [
              {
                title: '选项1',
                action: () => {
                  console.info('[ActionSheet] Option 1 selected')
                }
              },
              {
                title: '选项2',
                action: () => {
                  console.info('[ActionSheet] Option 2 selected')
                }
              },
              {
                title: '选项3',
                action: () => {
                  console.info('[ActionSheet] Option 3 selected')
                }
              }
            ],
            cancel: () => {
              console.info('[ActionSheet] Cancelled')
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
        .id('PopupBoxAvoidSafeZone0020_008')

      Text('测试场景:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0020_009')

      Text('当同时满足以下条件时，预期会产生编译报错：')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0020_010')

      Text('1. TestAbility配置沉浸式全屏模式')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('PopupBoxAvoidSafeZone0020_011')

      Text('2. ActionSheet设置showInSubWindow为true')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('PopupBoxAvoidSafeZone0020_012')

      Text('3. ActionSheet设置alignment参数')
        .fontSize(11)
        .fontColor('#FF6B6B')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0020_013')

      Text('当前状态:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0020_014')

      Text('已在TestAbility.ets中配置了沉浸式全屏模式（setWindowLayoutFullScreen(true)）。')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0020_015')

      Text('当前代码使用了标准的ActionSheet配置，如果编译器检测到沉浸式全屏与这些参数的冲突，会产生编译报错。')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0020_016')

      Text('错误原因:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0020_017')

      Text('在沉浸式全屏模式下，showInSubWindow和alignment的组合可能会导致ActionSheet显示位置计算错误或与安全区域（状态栏、导航栏）冲突。')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('PopupBoxAvoidSafeZone0020_018')

      Text('ActionSheet特点:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('PopupBoxAvoidSafeZone0020_019')

      Text('• 列表选择类对话框，通常从底部弹出')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('PopupBoxAvoidSafeZone0020_020')

      Text('• 支持多个操作选项')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('PopupBoxAvoidSafeZone0020_021')

      Text('• 在沉浸式全屏下需要特别处理安全区域')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('PopupBoxAvoidSafeZone0020_022')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
